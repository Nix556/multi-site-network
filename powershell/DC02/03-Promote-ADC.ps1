Write-Host "=== Step 3: Installing roles and promoting DC02 ===" -ForegroundColor Cyan

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

Write-Host "Promotion complete. The server will restart automatically after AD DS installation..." -ForegroundColor Yellow
