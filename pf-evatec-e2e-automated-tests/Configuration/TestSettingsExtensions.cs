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
/// Provides helper extensions for test setting values.
/// </summary>
public static class TestSettingsExtensions
{
    /// <summary>
    /// Creates a time-stamped name using the specified prefix.
    /// </summary>
    /// <param name="prefix">
    /// A name prefix used to identify the generated value.
    /// </param>
    /// <returns>
    /// A unique name with UTC timestamp suffix.
    /// </returns>
    public static string UniqueName(this string prefix)
    {
        var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss");
        return $"{prefix}_{timestamp}";
    }
}
