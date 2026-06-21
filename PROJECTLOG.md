# Project Log

Major project changes and events are documented here in reverse 
chronological order.

Note: Entries prior to 2026-06-06 were reconstructed retrospectively 
from my handwritten and typed notes and documentation.

## 2026-06-21

- Added physical topology diagram to represent Phase One changes
  - Established `docs/architecture/diagrams` as path for current, 
    reference artefacts

## 2026-06-16

- Published Phase One cutover report and associated documentation

## 2026-06-06

- Decision #002 - Adopted GitHub for project management and 
  documentation
- Adopted markdown architectural decision record (mADR) process
- Applied OPNsense updates 07:30. Required restart resulted in 
  approximately five minutes of scheduled downtime

## 2026-05-15

- Analysed pre- vs. post-cutover results.
  - Master: Observed increase in UDP packet loss, TCP retransmissions 
    and latency standard deviation to gateway. Opened issue #3 for 
    investigation.
  - Oaktree: observed UDP packet loss, increase of TCP retransmissions. 
    Opened issue #4 for hypothesis validation.

## 2026-05-14

- Configured system DNS to Cloudflare resolvers `1.1.1.1`, `1.0.0.1`; 
  disabled WAN DHCP override
  - Backed up OPNsense config

## 2026-05-13

- Performed second post-cutover benchmark with no user activity.

## 2026-05-09

- 09:30-11:30 Completed initial post-cutover benchmarks, contained user 
  activity contamination

## 2026-05-08 [Phase One - Cutover]

- 21:55 Started post-cutover benchmarking, completed on 9 May.
- 21:00-21:45 Executed cutover
  - Backed up OPNsense config
  - Resolved a WAN DHCP incident caused by an active DHCPv6 
    configuration before establishing WAN connectivity
  - Aligned switch port assignments with patch panel numbering. Opened a 
    task to update topology diagram
- 20:45 Reminded housemates about cutover in 15 minutes - confirmed 
  access not needed and OK to continue as planned

## 2026-05-07

- 14:30-16:30 Performed pre-cutover benchmarks in controlled conditions 
  with no user activity
- 10:30-11:45 Setup OPNsense with baseline configuration
  - Interfaces:
    - em0: onboard interface - Reserved
    - igb0: Intel Port 0 - LAN, `192.168.1.1/24`
    - igb1: Intel Port 1 - WAN, DHCPv4
  - Backed up OPNsense config
- Installed Intel i350-T2
- 13:30 Optiplex still powered on with no obvious issues
- 10:30 Received Intel i350-T2

## 2026-05-06
- 14:30 Received Optiplex, powered on for a sustained hardware test
- Established OPNsense setup checklist
- Wrote `benchmarker.sh`

## 2026-05-03

- Purchased Dell Optiplex 7060 and Intel i350-T2
- Defined Phase One goals, scope, success criteria, and selected 
  hardware

## 2026-04-28

- Decision #001 - Chose OPNsense as router and firewall platform

## 2026-04-21

- Started planning Serpentine homelab project

