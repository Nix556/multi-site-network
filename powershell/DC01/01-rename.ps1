$NewName = "DC01"

Rename-Computer -NewName $NewName -Force -Restart
Write-Host "DC renamed -> rebooting" -ForegroundColor Cyan