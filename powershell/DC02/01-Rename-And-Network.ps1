Write-Host "=== Step 1: Renaming server and configuring network ===" -ForegroundColor Cyan

$NewName     = "DC02"
$Interface   = "Ethernet"
$IPAddress   = "10.10.20.11"
$Prefix      = 24
$Gateway     = "10.10.20.1"
$DnsServers  = @("10.10.20.10")

New-NetIPAddress -InterfaceAlias $Interface -IPAddress $IPAddress -PrefixLength $Prefix -DefaultGateway $Gateway -ErrorAction SilentlyContinue
Set-DnsClientServerAddress -InterfaceAlias $Interface -ServerAddresses $DnsServers

Disable-NetAdapterBinding -Name $Interface -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue

Rename-Computer -NewName $NewName -Force

Write-Host "Server name changed to $NewName. Restarting now..." -ForegroundColor Yellow
Restart-Computer -Force
