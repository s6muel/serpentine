# Serpentine

Serpentine is a production-minded homelab focused on networking, 
infrastructure, and operational engineering practices.

The project was created to replace the limitations of consumer 
networking equipment with a configurable platform capable of supporting 
reliable network services and future segregated lab environment. In 
future phases, additional services and complexity will be introduced 
while maintaining the performance and stability of the production 
network.

This repository contains the documentation, supporting data, tooling, 
and engineering artefacts produced as the project progresses.

## Goals

- Build and operate a reliable network infrastructure using 
  production-grade tooling
- Develop practical networking, systems administration, and engineering 
  skills
- Validate changes through benchmarking and analysis
- Document decisions, implementation, and lessons learned
- Maintain a stable production environment while supporting ongoing 
  experimentation and future expansion

## Project Overview

**Status:** Phase One implementation and cutover complete. Follow-up to 
validate a regression hypothesis and benchmarking anomaly is required 
prior to starting Phase Two.

| Phase | Description | Status |
|---------|---------|---------|
| 01 | OPNsense cutover (MVP) | Complete |
| 01-a | Validation and follow up | In Progress |
| 02 | Implement IDS | Planning |

## Repository Structure

- `PROJECTLOG.md` High-level event and decision log
- `data/` Benchmarking data
- `docs/` Reports, decisions, manuals, and other supporting documentation
- `tools/` Scripts and tooling for benchmark data collection and processing

## Thank You

- To my partner, family, and friends, who have consistently supported 
  and encouraged me throughout a major career change, thank you for 
  believing in me - this is the start of something special!
- To Uzeir, my teacher throughout Certificate III & IV, whose guidance 
  and mentorship have been instrumental in furthering my technical 
  skills, and for always being happy to spend his spare time nerding out 
  with me. It has been a true pleasure.

## License

Copyright (c) 2026 Samuel Smith.

The contents of this repository are provided for viewing and educational
purposes. All rights reserved.

Software and scripts in the `tools/` directory are licensed separately 
under the MIT License. See [LICENSE](LICENSE).

