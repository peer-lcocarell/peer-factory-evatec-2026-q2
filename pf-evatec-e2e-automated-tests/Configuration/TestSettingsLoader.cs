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

        var envBaseUrl = Environment.GetEnvironmentVariable("PF_BASE_URL");
        if (!string.IsNullOrWhiteSpace(envBaseUrl))
        {
            settings = new TestSettings
            {
                BaseUrl = envBaseUrl.Trim(),
                UserName = settings.UserName,
                FoupToolId = settings.FoupToolId,
                CassetteToolId = settings.CassetteToolId,
                FileToolId = settings.FileToolId,
                DefaultPassword = settings.DefaultPassword,
            };
        }

        return settings;
    }
}
