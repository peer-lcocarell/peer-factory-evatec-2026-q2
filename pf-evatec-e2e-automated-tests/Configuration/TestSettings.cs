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

namespace PfEvatec.E2E.AutomatedTests.Configuration;

/// <summary>
/// Stores runtime settings used by the Playwright .NET test suite.
/// </summary>
public sealed class TestSettings
{
    /// <summary>
    /// Gets the base URL for the target Evatec environment.
    /// </summary>
    /// <value>
    /// A root URL used as the initial navigation address for UI tests.
    /// </value>
    public required string BaseUrl { get; init; }

    /// <summary>
    /// Gets the user name used for test authentication.
    /// </summary>
    /// <value>
    /// A valid user identifier configured for automated test execution.
    /// </value>
    public required string UserName { get; init; }

    /// <summary>
    /// Gets the FOUP tool identifier used by connection scenarios.
    /// </summary>
    /// <value>
    /// A tool ID that is expected to exist in the target environment.
    /// </value>
    public required string FoupToolId { get; init; }

    /// <summary>
    /// Gets the cassette tool identifier used by connection scenarios.
    /// </summary>
    /// <value>
    /// A tool ID that is expected to exist in the target environment.
    /// </value>
    public required string CassetteToolId { get; init; }

    /// <summary>
    /// Gets the file tool identifier used by connection scenarios.
    /// </summary>
    /// <value>
    /// A tool ID that is expected to exist in the target environment.
    /// </value>
    public required string FileToolId { get; init; }

    /// <summary>
    /// Gets the default password used for login.
    /// </summary>
    /// <value>
    /// A credential value used by automated login routines.
    /// </value>
    public required string DefaultPassword { get; init; }
}
