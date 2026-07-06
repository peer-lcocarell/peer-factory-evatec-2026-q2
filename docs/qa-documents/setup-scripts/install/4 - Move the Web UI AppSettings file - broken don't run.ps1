## Move the Release file to Web UI
$latestfolder = Get-ChildItem -Directory "C:\Program Files\PEER Group\" | ? { $_.PSIsContainer } | sort CreationTime -desc | select -f 1
$path = "C:\Program Files\PEER Group\" + $latestFolder.Name + "\WebUI\"
cd $path
Copy-Item -Path 'C:\Automation\Files\appsettings.Release.json' -Destination $path

Write-Host "Appsettings.Release.json file moved to WebUI folder."
Start-Sleep -Seconds 3
