# Use OPNsense as the router and firewall

Status: Accepted
Decision Date: 2026-04-28
Recorded: 2026-06-06

## Context and Problem Statement

Serpentine requires routing and firewall functionality with strong 
logging and observability. The platform also needs to be capable of 
supporting future IDS, VLAN, VPN, and DMZ requirements.

## Considered Options

- OPNsense
- pfSense

## Decision Outcome

OPNsense was chosen because it meets the project requirements for 
routing, firewall, observability, and additional features. Additionally, 
I have existing familiarity with its interface and underlying FreeBSD 
system, along with exposure through Certificate IV studies. This 
familiarity helps mitigate deployment and misconfiguration risk.

It was also recommended by a trusted industry mentor, supporting my 
learning through discussion without needing to translate between 
different platform terms and workflows.

OPNsense is also actively maintained, making it a stable platform for a 
network with reliability constraints. It also has excellent public 
documentation which is useful when needing to troubleshoot or apply 
advanced configurations.

## Consequences

Good:
- Supports future requirements (IDS, VLAN, VPN, DMZ)
- Faster deployment and troubleshooting
- Reduced misconfiguration risk
- Fits existing FreeBSD knowledge

Bad:
- Requires learning OPNsense specific administration workflows
- Creates some dependency on platform-specific knowledge

## References

Project Log: N/A

Original decision recorded in private notebook during mentor discussion.

