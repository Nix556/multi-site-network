$DomainName = "torbenbyg.local"
$DSRMPassword = Read-Host "Enter DSRM password" -AsSecureString

Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $DSRMPassword `
    -InstallDNS `
    -Force:$true

Write-Host "Domain Controller promotion complete — restart now!" -ForegroundColor Yellow
Restart-Computer
