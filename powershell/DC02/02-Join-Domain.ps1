Write-Host "=== Step 2: Joining the server to the domain ===" -ForegroundColor Cyan

$DomainName = "torbenbyg.local"

Add-Computer -DomainName $DomainName -Credential (Get-Credential) -Force -Restart
