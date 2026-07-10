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

using System.Text.Json;

namespace PfEvatec.E2E.AutomatedTests.Configuration;

/// <summary>
/// Loads <see cref="TestSettings" /> from disk and runtime overrides.
/// </summary>
public static class TestSettingsLoader
{
    /// <summary>
    /// Loads test settings from configuration and environment variables.
    /// </summary>
    /// <returns>
    /// A populated <see cref="TestSettings" /> instance.
    /// </returns>
    /// <exception cref="FileNotFoundException">
    /// The settings file is not found in the expected output directory.
    /// </exception>
    /// <exception cref="InvalidOperationException">
    /// The settings JSON cannot be deserialized into a valid object.
    /// </exception>
    public static TestSettings Load()
    {
        var baseDirectory = AppContext.BaseDirectory;
        var configPath = Path.Combine(baseDirectory, "Configuration", "testsettings.json");

        if (!File.Exists(configPath))
        {
            throw new FileNotFoundException($"Missing test settings file at '{configPath}'.");
        }

        var json = File.ReadAllText(configPath);
        var settings = JsonSerializer.Deserialize<TestSettings>(json, new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true,
        });

        if (settings is null)
        {
            throw new InvalidOperationException("Unable to deserialize test settings.");
        }

        settings = new TestSettings
        {
            BaseUrl = GetOverride("PF_BASE_URL", settings.BaseUrl),
            UserName = GetOverride("PF_USERNAME", settings.UserName),
            FoupToolId = GetOverride("PF_FOUP_TOOL_ID", settings.FoupToolId),
            CassetteToolId = GetOverride("PF_CASSETTE_TOOL_ID", settings.CassetteToolId),
            FileToolId = GetOverride("PF_FILE_TOOL_ID", settings.FileToolId),
            DefaultPassword = GetOverride("PF_DEFAULT_PASSWORD", settings.DefaultPassword),
        };

        ValidateRequired(settings);

        return settings;
    }

    private static string GetOverride(string envKey, string fallback)
    {
        var candidate = Environment.GetEnvironmentVariable(envKey);
        return string.IsNullOrWhiteSpace(candidate) ? fallback : candidate.Trim();
    }

    private static void ValidateRequired(TestSettings settings)
    {
        var missing = new List<string>();

        if (string.IsNullOrWhiteSpace(settings.BaseUrl)) { missing.Add(nameof(settings.BaseUrl)); }
        if (string.IsNullOrWhiteSpace(settings.UserName)) { missing.Add(nameof(settings.UserName)); }
        if (string.IsNullOrWhiteSpace(settings.DefaultPassword)) { missing.Add(nameof(settings.DefaultPassword)); }
        if (string.IsNullOrWhiteSpace(settings.FoupToolId)) { missing.Add(nameof(settings.FoupToolId)); }
        if (string.IsNullOrWhiteSpace(settings.CassetteToolId)) { missing.Add(nameof(settings.CassetteToolId)); }
        if (string.IsNullOrWhiteSpace(settings.FileToolId)) { missing.Add(nameof(settings.FileToolId)); }

        if (missing.Count > 0)
        {
            throw new InvalidOperationException($"Missing required test settings: {string.Join(", ", missing)}.");
        }
    }
}
