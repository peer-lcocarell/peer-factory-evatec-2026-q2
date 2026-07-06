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



## Update the gRCP config
$file = 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Components.config'


##$find = '<port host="localhost" port="9090" credentials="insecure" />'
##$replace = '<port host="evatec2012r2qa4" port="9090" credentials="insecure" />'
## (Get-Content $file).replace($find, $replace) | Set-Content $file




$find1 = '<ConnectionTimeout>20</ConnectionTimeout>'
$replace1 = '<ConnectionTimeout>4000</ConnectionTimeout>'
(Get-Content $file).replace($find1, $replace1) | Set-Content $file


$find2 = '<FileWatchFolder>Files\Uploaded</FileWatchFolder>'
$replace2 = '<FileWatchFolder>\\EVATEC2012R2QA4\Uploaded</FileWatchFolder>'
(Get-Content $file).replace($find2, $replace2) | Set-Content $file


$find3 = '<HostAddress>localhost</HostAddress>'
$replace3 = '<HostAddress>evatec2012r2qa4</HostAddress>'
(Get-Content $file).replace($find3, $replace3) | Set-Content $file


$datasourcePFDB =  '<AutomationComponent Type="PEERFactory.DataStorage.DatabaseConnection, PEERFactory.DataStorage">
      <Deployments>
        <Element>Simulation</Element>
      </Deployments>
    </AutomationComponent>'

$datasourcePFDB =  '<AutomationComponent Type="PEERFactory.DataStorage.DatabaseConnection, PEERFactory.DataStorage">
      <DataSource>EVATEC2012R2QA4\SQLEXPRESS2017</DataSource>
      <Deployments>
        <Element>Simulation</Element>
      </Deployments>
    </AutomationComponent>'
	


 $find4 = '<AutomationComponent Type="Evatec.Services.BPSImportService, Evatec.Services">
          <DefaultExecutionTimeout>3600</DefaultExecutionTimeout>'

 $replace4 = '<AutomationComponent Type="Evatec.Services.BPSImportService, Evatec.Services">
          <DataSource>EVATEC2012R2QA4\SQLEXPRESS2017</DataSource>
          <DefaultExecutionTimeout>3600</DefaultExecutionTimeout>'
	  

 (Get-Content $file).replace($find4, $replace4) | Set-Content $file

## EVATEC2012R2QA4\SQLEXPRESS2017


Write-Host "MES configuration updated."
Start-Sleep -Seconds 3
