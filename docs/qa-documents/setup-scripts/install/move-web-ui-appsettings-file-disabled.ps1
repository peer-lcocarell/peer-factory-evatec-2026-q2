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

## Move the Release file to Web UI
$latestfolder = Get-ChildItem -Directory "C:\Program Files\PEER Group\" | ? { $_.PSIsContainer } | sort CreationTime -desc | select -f 1
$path = "C:\Program Files\PEER Group\" + $latestFolder.Name + "\WebUI\"
cd $path
Copy-Item -Path 'C:\Automation\Files\appsettings.Release.json' -Destination $path

Write-Host "Appsettings.Release.json file moved to WebUI folder."
Start-Sleep -Seconds 3

