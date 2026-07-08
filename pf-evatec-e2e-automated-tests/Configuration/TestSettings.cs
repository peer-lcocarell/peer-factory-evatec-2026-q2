namespace PfEvatec.E2E.AutomatedTests.Configuration;

public sealed class TestSettings
{
    public required string BaseUrl { get; init; }

    public required string UserName { get; init; }

    public required string FoupToolId { get; init; }

    public required string CassetteToolId { get; init; }

    public required string FileToolId { get; init; }

    public required string DefaultPassword { get; init; }
}
