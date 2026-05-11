$DomainName = "torbenbyg.local"
$ReplicationSource = "DC01.torbenbyg.local"
$DSRMPassword = Read-Host "Enter DSRM password" -AsSecureString

Install-WindowsFeature -Name AD-Domain-Services, DNS, DHCP -IncludeManagementTools

Install-ADDSDomainController `
    -DomainName $DomainName `
    -ReplicationSourceDC $ReplicationSource `
    -InstallDNS:$true `
    -Credential (Get-Credential) `
    -SafeModeAdministratorPassword $DSRMPassword `
    -Force:$true

Write-Host "DC02 promotion complete - restarting..." -ForegroundColor Yellow