$NewName    = "DC02"
$Interface  = "Ethernet"
$IPAddress  = "10.10.20.11"
$Prefix     = 24
$Gateway    = "10.10.20.1"
$DnsServers = @("10.10.20.10")

New-NetIPAddress -InterfaceAlias $Interface -IPAddress $IPAddress -PrefixLength $Prefix -DefaultGateway $Gateway -ErrorAction Stop
Set-DnsClientServerAddress -InterfaceAlias $Interface -ServerAddresses $DnsServers

Disable-NetAdapterBinding -Name $Interface -ComponentID ms_tcpip6 -ErrorAction Stop

Rename-Computer -NewName $NewName -Force

Write-Host "DC02 configured - rebooting..." -ForegroundColor Yellow
Restart-Computer -Force