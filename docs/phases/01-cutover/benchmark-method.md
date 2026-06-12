# Benchmark Methodology

Project: Serpentine
Date: Thu May  7 2026
Version: 0.1
Status: Approved

## Purpose and Scope

To establish a benchmark methodology that allows me to measure network 
and WAN throughput and bandwidth pre and post cutover based on real 
world performance.

## Structure

+-------------------------------+---------------------------------------+-----------------------+
| Test				| Measurement				| Tool			|
+-------------------------------+---------------------------------------+-----------------------+
| WiFi LAN (each room)		| Wireless throughput to wired host	| iperf3 TCP+UDP	|
| Wired LAN			| Baseline LAN throughput		| iperf3 TCP		|
| WAN speedtest			| WAN uplink throughput			| speed.cloudflare.com	|
| Latency LAN (each room) 	| Latency to gateway & 1.1.1.1		| ping -c 100		|
+-------------------------------+---------------------------------------+-----------------------+

## Requirements

- All output from executed commands should be captured in a file with 
  the title format of `<room>_<test>_<date>.txt` for review and 
  analysis.

## Tests

### Command reference

- TCP TEST
iperf3 -c 192.168.4.196 -t 30
- UDP TEST
iperf3 -c 192.168.4.196 -u -b 700M -t 30 -p 5201 --cport 5202
- LATENCY
Gateway
ping 192.168.4.1 -c 100
IP host
ping 1.1.1.1 -c 100

### WiFi LAN

Conducted with wireless laptop.

+---------------+-------------------------------+--------+
| Room		| Test				| Tested |
+---------------+-------------------------------+--------+
| Lounge	| Wireless throughput TCP	| 	 |
| Lounge	| Wireless throughput UDP	| 	 |
| Lounge	| Latency to gateway		| 	 |
| Lounge	| Latency to IP host		| 	 |
| Lounge	| WAN speed test		| 	 |
| Kitchen	| Wireless throughput TCP	| 	 |
| Kitchen	| Wireless throughput UDP	| 	 |
| Kitchen	| Latency to gateway		| 	 |
| Kitchen	| Latency to IP host		| 	 |
| Office	| Wireless throughput TCP	| 	 |
| Office	| Wireless throughput UDP	| 	 |
| Office	| Latency to gateway		| 	 |
| Office	| Latency to IP host		| 	 |
| Master	| Wireless throughput TCP	| 	 |
| Master	| Wireless throughput UDP	| 	 |
| Master	| Latency to gateway		| 	 |
| Master	| Latency to IP host		| 	 |
+---------------+-------------------------------+--------+

### Wired LAN

Conducted with wired host.

+-------------------------------+--------+
| Test				| Tested |
+-------------------------------+--------+
| Wired throughput TCP		| 	 |
| Wired throughput UDP		| 	 |
| Latency to gateway		| 	 |
| Latency to IP host		| 	 |
| WAN BASELINE speed test	| 	 |
+-------------------------------+--------+

