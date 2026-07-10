# ------------------------------------------------------------------------------
# Copyright (C) The PEER Group Inc., 2026.
#
# This software contains confidential and trade secret information belonging
# to PEER Group Inc. All Rights Reserved.
#
# No part of this software may be reproduced or transmitted in any form or by
# any means, electronic, mechanical, photocopying, recording, or otherwise,
# without the prior written consent of PEER Group Inc.
# ------------------------------------------------------------------------------

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [switch]$CacheCredential,

    [Parameter(Mandatory = $false)]
    [PSCredential]$Credential
)

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$mainScript = Join-Path $scriptRoot 'Connect-RdpVm.ps1'

& $mainScript -VmName 'pf-wsc19-qa3' -CacheCredential:$CacheCredential -Credential $Credential
