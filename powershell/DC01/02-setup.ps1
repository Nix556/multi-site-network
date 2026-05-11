$interface = "Ethernet"
$ipAddress = "10.10.20.10"
$prefixLength = 24
$gateway = "10.10.20.1"
$dnsServers = @("10.10.20.10","1.1.1.1")

New-NetIPAddress -InterfaceAlias $interface -IPAddress $ipAddress -PrefixLength $prefixLength -DefaultGateway $gateway
Set-DnsClientServerAddress -InterfaceAlias $interface -ServerAddresses $dnsServers
Disable-NetAdapterBinding -Name $interface -ComponentID ms_tcpip6

$diskNumber = 1
$driveLetter = "F"

if (-not (Get-Partition -DiskNumber $diskNumber -ErrorAction SilentlyContinue)) {
    Initialize-Disk -Number $diskNumber -PartitionStyle GPT -ErrorAction SilentlyContinue
    $part = New-Partition -DiskNumber $diskNumber -UseMaximumSize -DriveLetter $driveLetter
    Format-Volume -Partition $part -FileSystem NTFS -NewFileSystemLabel "UserData" -Confirm:$false
}

Install-WindowsFeature -Name AD-Domain-Services, DNS, FS-FileServer, DHCP -IncludeManagementTools

Write-Host "Setup complete - reboot before domain promotion." -ForegroundColor Yellow
Restart-Computer