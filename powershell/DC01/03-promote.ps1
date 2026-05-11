$DomainName = "torbenbyg.local"
$DSRMPassword = Read-Host "Enter DSRM password" -AsSecureString

Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $DSRMPassword `
    -InstallDNS `
    -Force:$true `
    -NoRebootOnCompletion:$true

Write-Host "Promotion done - rebooting manually..." -ForegroundColor Yellow
Restart-Computer