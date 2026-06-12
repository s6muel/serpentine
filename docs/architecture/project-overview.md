# Serpentine Home Lab - Project Overview

Commenced: April 21  2026
Complete:

## Brief

Serpentine is a home lab that enables hands-on work with production 
grade tooling in a live environment, and exposing public facing 
services. The live environment is a home network that provides 
connectivity for working-from-home and general use, which demands high 
reliability and performance. Currently, networking is provided by 2 Eero 
6+ routers configured in Automatic Mode (i.e., serving DHCP and NAT 
services, and providing WAN access, to the LAN) providing wired 
connectivity via 1Gbe ethernet, and WLAN via 802.11ax AC3000. The 
inability to configure these devices in a manner that can safely serve a 
lab and live production network in parallel required the implementation 
of a configurable router.

In addition to providing networking capabilities, Serpentine should also 
accommodate lab experimentation and provide the ability to layer on 
features without impacting performance of the production network. This 
requires a reasonable baseline of processing power and memory with the 
ability to upgrade, with a strict budget constraint.

## Phase One: MVP

Status: DONE

Implement Serpentine/OPNsense router, and establish a baseline 
configuration; provide reliable network services including stable mesh; 
implement the physical topology plan.

## Phase Two: Layering Services

Status: PLANNING

Introduce IDS with minimal rules and benchmark network and router 
performance & utilisation.

TODO: Define ruleset to use

## Phase Three: Managed Switch & Ubiquiti WAP upgrade - VLAN setup

Status: PLANNING

Implement managed switch and Ubiquiti WAP upgrades.

Establish VLAN on new switch and setup private, lab, and DMZ VLANs.

Configure OPNsense for relevant VLANs and interface assignments.

## Phase Four: Expose the first service - VPN

Status: PLANNING

Expose a DMZ to the wan and setup a WireGuard VPN server for LAN access, 
and secure remote router management.

## Phase Five: Exposed service (TBC)

Status: NOT STARTED


## Appendix

Statuses:

DONE
IN PROGRESS
PLANNING
NOT STARTED
CANCELLED

