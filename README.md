# Svendprøve - IT Supporter

Multi-site network lab built for practice and final exam preparation as an IT Supporter.

Project includes:
- VLAN segmentation
- OSPF routing
- NAT
- Active Directory
- DHCP/DNS
- Proxmox virtualization
- Physical Cisco routers and switches

Sites:
- Odense
- Nyborg
- Svendborg

---

## Overview

The setup simulates a small company with multiple locations connected over WAN links.

Odense acts as the main site with:
- Internet access
- Proxmox host
- Domain Controllers
- DNS/DHCP services

Nyborg and Svendborg are connected via OSPF and use RT01 as upstream router.

---

## Network Layout

### VLANs

| VLAN | Purpose    | Subnet        |
| ---- | ---------- | ------------- |
| 10   | Clients    | 10.10.10.0/24  |
| 20   | Servers    | 10.10.20.0/24  |
| 30   | Printers   | 10.10.30.0/24  |
| 99   | Management | 10.10.99.0/24  |

---

### Routing

- OSPF between all sites
- NAT on RT01
- Router-on-a-stick setup
- /30 WAN links between routers

---

## Devices

| Device   | Purpose                |
| -------- | ---------------------- |
| RT01     | Main router (NAT, OSPF) |
| RT02     | Nyborg router         |
| RT03     | Svendborg router      |
| SW01-03  | VLAN + trunk config   |
| Proxmox  | Hosts DC01/DC02       |

---

## Domain Controllers

### DC01
- Primary domain controller
- DNS
- DHCP
- File services

### DC02
- Secondary DC
- Replication / failover
- Backup DHCP

PowerShell setup scripts are included in the repository.

---

## Structure

```text
configs/
├── routers/
├── switches/

powershell/
├── dc01/
│   ├── 01-network.ps1
│   ├── 02-setup.ps1
│   ├── 03-promote.ps1
│   └── 04-post-setup.ps1
│
├── dc02/
│   ├── 01-network.ps1
│   ├── 02-domain-join.ps1
│   ├── 03-promote.ps1
│   └── 04-dhcp-failover.ps1
````

---

## Notes

* Built mainly as a lab and final exam preparation project
* Uses both physical hardware and virtualization
* Some configs are just quick notes or leftovers from testing
* Still contains messy or unfinished parts
