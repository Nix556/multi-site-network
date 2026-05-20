# Svendeprøve - IT Supporter

Multi-site netværkslab lavet til øvelse og svendeprøve som IT-supporter.

Projektet inkluderer blandt andet:

- VLAN segmentering
- OSPF routing
- NAT
- Active Directory
- DHCP/DNS
- Proxmox virtualisering
- Fysiske Cisco routers/switches

Sites:

- Odense
- Nyborg
- Svendborg

---

## Overview

Setup'et simulerer et mindre firma med flere lokationer forbundet over WAN links.

Odense fungerer som hovedsite med:

- Internet adgang
- Proxmox host
- Domain Controllers
- DNS/DHCP services

Nyborg og Svendborg er forbundet via OSPF og bruger RT01 som upstream router.

---

## Network Layout

### VLANs

| VLAN | Purpose | Subnet |
| --- | --- | --- |
| 10 | Clients | 10.x.10.0/24 |
| 20 | Servers | 10.x.20.0/24 |
| 30 | Printers | 10.x.30.0/24 |
| 99 | Management | 10.x.99.0/24 |

### Routing

- OSPF mellem alle sites
- NAT på RT01
- Router-on-a-stick setup
- /30 WAN links mellem routers

---

## Devices

| Device | Purpose |
| --- | --- 
| RT01 | Main router, NAT, OSPF |
| RT02 | Nyborg router |
| RT03 | Svendborg router |
| SW01-03 | VLAN + trunk config |
| Proxmox | Hosts DC01/DC02 |

---

## Domain Controllers

### DC01

- Primary domain controller
- DNS
- DHCP
- File services

### DC02

- Secondary DC
- Replication/failover
- Backup DHCP

PowerShell setup scripts findes i repository'et.

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
```

---

## Notes

- Bygget primært som lab/svendeprøve projekt
- Bruger både fysisk hardware og virtualisering
- Mange configs er også bare noter til mig selv
- Indeholder sikkert stadig random ting jeg har glemt at rydde op i
