# Phase One Implementation Plan

Project: Serpentine
Phase: One
Date: Wed May  6 2026
Version: 1.0
Status: Approved (Wed May  7 2026)

## Purpose and Scope

Serpentine is a firewall and router powered by OPNsense. Its purpose is 
to provide a live environment for observation and administration to 
further and build my networking knowledge while gaining hands on 
experience.  Serpentine phase one is focused on providing WAN and DHCP 
services to the private network, with a configured firewall to ensure 
security.  This phase is strictly focused on the implementation of the 
minimum viable product. Configuration of VLANs, IDS/IPS, and a DMZ is 
part of phase two and is out of scope.

## Goals

1. Line rate throughput (1Gbps),
2. Does not degrade existing performance (i.e., pass the girlfriend 
test),
3. Target availability: 99.95% or 20m downtime per month,
4. No tinkering, only auditing

## Current State

22bit block 192.168.4.0/22, 192.168.4.0 - 192.168.7.255
DHCP

Eero:
- Gateway: 192.168.4.1
WAN (acquired via DHCP):
- IP: 100.97.242.68
- SN: 255.248.0.0
- Router: 100.96.0.1
DNS
- 1.1.1.1, 1.0.0.1, 2606:4700:4700::1111, 2606:4700:4700::1001

### Inventory

+-------+-----------------------+-------------------------------+
|  qty	| description		| purpose			|
+-------+-----------------------+-------------------------------+
|   1	| Patch panel		| l1 connections to house	|
|   1	| ONT device		| supplies WAN			|
|   2	| Eero 6 routers	| firewall, DHCP, WAN		|
|   1	| Unmanaged switch	|				|
|   2	| PCs			|				|
|   3	| Laptops		|				|
|   4	| Tablets		|				|
|	| Smart phones		|				|
|   1	| Smart TV		|				|
+-------+-----------------------+-------------------------------+

## Proposed State

### Inventory

+-------+-----------------------+-------------------------------+
|  qty	| description		| purpose			|
+-------+-----------------------+-------------------------------+
|   1	| Patch panel		| l1 connections to house	|
|   1	| ONT device		| supplies WAN			|
|   1	| Optiplex 7060 	| firewall, DHCP, WAN access	|
|   2	| Eero 6 (bridge mode)	| WAPs				|
|   1	| Unmanaged switch	|				|
|   2	| PCs			|				|
|   3	| Laptops		|				|
|   4	| Tablets		|				|
|	| Smart phones		|				|
|   1	| Smart TV		|				|
+-------+-----------------------+-------------------------------+

### IP Addressing

16bit block 192.168.0.0/16, 192.168.0.0 - 192.168.255.255

LAN:
- 192.168.1.0/24, 255.255.255.0
STATIC RESERVATIONS:
- 192.168.1.2 -> 192.168.1.20
DHCP pool:
- 192.168.1.21 -> 192.168.1.254
SN:
- 255.255.255.0
DNS:
- 1.1.1.1, 1.0.0.1, 2606:4700:4700::1111, 2606:4700:4700::1001

### Interface Assignments

Optiplex

Onboard:
- port 0, RESERVED - LAB
Intel NIC:
- port 0, LAN, 192.168.1.1 -> Eero Port 0
- port 1, WAN, DHCP

### Design Decisions

- 192.168.0.0/16 address chosen for adequate hosts, consistency and 
  simplicity; 10.0.0.0/8 block is overkill
- Optiplex model chosen for power efficiency and overhead for 
  performance in IDS configurations and service hosting
- Eero upstream from switch to accommodate proprietary mesh in line with 
  public recommendations; flat network result in poor mesh performance 
  or failure altogether, and can cause false positive port blocks due to 
  STP protections in managed switch configurations

## Pre-Implementation Checklist

- [x] Dell Optiplex verified working offline
- [x] Intel i350-T2 verified working
- [x] OPNsense installed and base config (WAN, DHCP, upstream DNS) 
  confirmed prior to cutover
- [ ] Config backup schedule set
- [x] Cutover and downtime window communicated to users
- [x] Rollback plan
- [x] Benchmarked current network performance

## Risk Register

Risk: Eero silently fails to disable NAT services causing double NAT
- Likelihood: Low
- Impact: Medium
- Mitigation: Confirm devices receive IP leases in the 192.168.1.0/24 
  range only to confirm Serpentine is the active DHCP server

Risk: DHCP service conflicts with lingering Eero leases
- Likelihood: Medium
- Impact: High
- Mitigation: Allow Eero supplied leases to expire prior to cutover

Risk: Unable to gain a WAN IP address via DHCP
- Likelihood: Medium
- Impact: High
- Mitigation: Ensure DHCP ports allowed on WAN port

Risk: Poor mesh performance
- Likelihood: Low
- Impact: Medium
- Mitigation: Attempt downstream setup and re-test; last resort use one 
  Eero only or rollback if performance too poor

Risk: Cutover runs past maintenance window
- Likelihood: Medium
- Impact: Medium
- Mitigation: If cutover is expected to run into WFH hours, execute a 
  rollback (allow 1.5hours buffer) and revise and reschedule 
  implementation plan

Risk: Misconfiguration results in sub optimal security
- Likelihood: Medium
- Impact: High
- Mitigation: Increase monitoring and auditing frequency for first 30 
  days post cutover, update configuration as required while continuing 
  to maintain config backups for rollback

## Cutover Rollback Plan

Rollback executed if cutover not confirmed successful within 3.5hrs 
(~00:30)

- Configure Eero back to Automatic mode:
  - Eero App -> Settings -> Advanced Networking -> select Automatic Mode
- Disconnect WAN from Optiplex and power off
- Connect WAN to Eero
- Confirm pre cutover state re-established (WAN connection, DHCP)

## Maintenance Window

- Expected window: 4 hrs (2hrs + 1.5hrs buffer + 0.5hrs rollback)
- Friday, May 8, 2026, 21:00-01:00
- verbally communicate window to household, with a 15m heads-up prior to 
  cutover,  that we'll be without internet and network functionality

## Implementation Steps

1. Configure Optiplex offline, zero user impact
COMPLETED: Fri May  8 11:30 Hours; 1 Hour total
- NIC install
- Disable secure boot, TPM in BIOS (F2 on boot)
- OPNsense installation (F12 on boot)
- baseline configuration
	- wan interface
	- lan interface
	- dhcp service
	- upstream DNS
	- firewall
2. Pre cut over checks (network still live)
COMPLETED: Fri May  8 20:55
- Optiplex in working order, base config established and backed up
- Cables unboxed, prepared
- Inventory count
3. Cutover
COMPLETED: Fri May  8 21:45
- Eero set to bridge mode [must happen prior to WAN disconnect]
- Remove existing cables from patch panel
- Disconnect WAN and switch from Eero
- Connect patch panel to switch
- Connect Optiplex to Eero
- Establish LAN connection, check DHCP
- Connect WAN to optiplex, check internet and DNS resolution
- Execute configuration backup
- Conduct system update
- Re-check networking status
4. Confirm cutover successful
5. Benchmark performance

See `docs/phases/01-cutover/setup-log.txt` for complete cutover log

## Post Implementation Review

- Goals and success criteria met?
- Analyse and compare pre- and post-cutover benchmarks. Improved 
  performance?
- What took longer than expected?
- What required troubleshooting and fixing?
- What technical debt was taken on?
- Next phase steps
- Monitoring and review, update schedule

## References

  1. Specifications: Intel i5-8500, 8GB DDR4, 256GB SSD, Intel onboard 
    1Gbe NIC + Intel i350-T2 NIC (3 ports total).
  2. RFC 1918 - Address Allocation for Private Internets, 
     https://www.rfc-editor.org/rfc/rfc1918.txt
  3. OPNsense manual - https://docs.opnsense.org/index.html
  4. Dell Optiplex 7060 SFF service manual

