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

namespace PfEvatec.E2E.AutomatedTests.Pages;

/// <summary>
/// Encapsulates login actions for the Evatec web client.
/// </summary>
public sealed class LoginPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="LoginPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public LoginPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Signs in using the specified credentials.
    /// </summary>
    /// <param name="userName">
    /// A valid user name for the target environment.
    /// </param>
    /// <param name="password">
    /// A valid password for the supplied user.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous sign-in operation.
    /// </returns>
    public async Task SignInAsync(string userName, string password)
    {
        await _page.Locator("#clr-input-0").FillAsync(userName);
        await _page.Locator("#clr-password-0").FillAsync(password);
        await _page.GetByRole(AriaRole.Button, new() { Name = "Sign In" }).ClickAsync();
    }
}
