


##  Move the modified MES configuration to MES - Server folder
Copy-Item -Path 'C:\Automation\Files\Components.config' -Destination 'C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\' -Recurse -force
Write-Host "Updated MES configuration moved to MES - Server folder."
Start-Sleep -Seconds 3


