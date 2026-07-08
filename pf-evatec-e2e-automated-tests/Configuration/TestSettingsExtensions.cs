namespace PfEvatec.E2E.AutomatedTests.Configuration;

public static class TestSettingsExtensions
{
    public static string UniqueName(this string prefix)
    {
        var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss");
        return $"{prefix}_{timestamp}";
    }
}
