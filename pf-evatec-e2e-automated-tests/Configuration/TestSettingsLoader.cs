using System.Text.Json;

namespace PfEvatec.E2E.AutomatedTests.Configuration;

public static class TestSettingsLoader
{
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
