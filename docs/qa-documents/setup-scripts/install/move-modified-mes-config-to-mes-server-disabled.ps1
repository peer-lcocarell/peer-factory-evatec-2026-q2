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




##  Move the modified MES configuration to MES - Server folder
Copy-Item -Path 'C:\Automation\Files\Components.config' -Destination 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\' -Recurse -force
Write-Host "Updated MES configuration moved to MES - Server folder."
Start-Sleep -Seconds 3



