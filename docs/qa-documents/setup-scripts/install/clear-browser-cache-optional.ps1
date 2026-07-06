

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

