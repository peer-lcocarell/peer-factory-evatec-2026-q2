#region Copyright Notice
//
// Copyright(C) The PEER Group Inc., 2026.
//
// This software contains confidential and trade secret information
// belonging to The PEER Group Inc. All Rights Reserved.
//
// No part of this software may be reproduced or transmitted in any form
// or by any means, electronic, mechanical, photocopying, recording or
// otherwise, without the prior written consent of The PEER Group Inc.
//
#endregion

using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

/// <summary>
/// Provides shared resilience helpers for UI synchronization and interaction.
/// </summary>
internal static class UiStability
{
    private static readonly string[] BusySelectors =
    {
        "div.modal:visible",
        "div.visible[id^='modal-']",
        ".modal-backdrop:visible",
        "clr-spinner:visible",
        ".spinner:visible",
        ".loading:visible",
        ".busy-overlay:visible",
        "[aria-busy='true']:visible",
    };

    public static async Task WaitForPageReadyAsync(IPage page, int timeoutMs = 30_000)
    {
        await page.WaitForLoadStateAsync(LoadState.DOMContentLoaded, new() { Timeout = timeoutMs });

        try
        {
            await page.WaitForLoadStateAsync(LoadState.NetworkIdle, new() { Timeout = 5_000 });
        }
        catch (TimeoutException)
        {
            // Some pages keep background requests open; DOM readiness is sufficient here.
        }

        await WaitForBusyUiToClearAsync(page, timeoutMs);
    }

    public static async Task WaitForBusyUiToClearAsync(IPage page, int timeoutMs = 15_000)
    {
        foreach (var selector in BusySelectors)
        {
            try
            {
                await page.Locator(selector).First.WaitForAsync(new()
                {
                    State = WaitForSelectorState.Hidden,
                    Timeout = timeoutMs,
                });
            }
            catch (TimeoutException)
            {
                // Ignore selectors that are not present or remain present but not actionable.
            }
        }
    }

    public static async Task DismissBlockingDialogsAsync(IPage page)
    {
        var dismissButtons = new[] { "Close", "Cancel", "No", "OK", "Ok" };
        foreach (var button in dismissButtons)
        {
            var locator = page.GetByRole(AriaRole.Button, new() { Name = button }).First;
            if (await locator.IsVisibleAsync())
            {
                await locator.ClickAsync();
            }
        }

        var popoverOverlay = page.Locator(".popover-overlay").First;
        if (await popoverOverlay.IsVisibleAsync())
        {
            await popoverOverlay.ClickAsync(new() { Force = true });
        }

        await page.Keyboard.PressAsync("Escape");
        await WaitForBusyUiToClearAsync(page, timeoutMs: 5_000);
    }

    public static async Task SafeClickAsync(ILocator target, IPage page, string actionName, int timeoutMs = 15_000)
    {
        await WaitForPageReadyAsync(page);
        await Expect(target).ToBeVisibleAsync(new() { Timeout = timeoutMs });
        await Expect(target).ToBeEnabledAsync(new() { Timeout = timeoutMs });

        for (var attempt = 1; attempt <= 3; attempt++)
        {
            try
            {
                await WaitForBusyUiToClearAsync(page);
                await target.ScrollIntoViewIfNeededAsync();
                await target.ClickAsync(new() { Timeout = timeoutMs });
                return;
            }
            catch (PlaywrightException ex) when (ex.Message.Contains("intercepts pointer events", StringComparison.OrdinalIgnoreCase))
            {
                await DismissBlockingDialogsAsync(page);

                if (attempt == 3)
                {
                    throw new PlaywrightException($"Unable to click '{actionName}' because overlays continued to block input.", ex);
                }
            }
        }
    }

    public static async Task SafeFillAsync(ILocator target, IPage page, string value, int timeoutMs = 15_000)
    {
        await WaitForPageReadyAsync(page);
        await Expect(target).ToBeVisibleAsync(new() { Timeout = timeoutMs });
        await Expect(target).ToBeEnabledAsync(new() { Timeout = timeoutMs });
        await target.FillAsync(value, new() { Timeout = timeoutMs });
    }
}
