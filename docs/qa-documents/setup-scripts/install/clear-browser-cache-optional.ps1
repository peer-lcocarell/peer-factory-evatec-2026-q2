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

## Clear the User's Cache

Write-Host "Clearing the default Chrome browser's cache"


$Items = @('Archived History',
            'Cache\*',
            'Cookies',
            'History',
            'Login Data',
            'Top Sites',
            'Visited Links',
            'Web Data')
$Folder = "C:\Users\administrator.EVATEC\AppData\Local\Google\Chrome\User Data\Profile 3"
$Items | % { 
    if (Test-Path "$Folder\$_") {
        Remove-Item "$Folder\$_" 
    }
}

Start-Sleep -Seconds 3

