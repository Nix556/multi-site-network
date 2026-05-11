$DomainName = "torbenbyg.local"

Add-Computer -DomainName $DomainName -Credential (Get-Credential) -Force

Write-Host "Domain join complete - rebooting..." -ForegroundColor Yellow
Restart-Computer -Force