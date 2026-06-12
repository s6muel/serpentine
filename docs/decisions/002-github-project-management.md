# Use Git with GitHub Projects for project management

Status: Accepted
Date: 2026-06-06

## Context and Problem Statement

The project needed a centralised space to organise documentation, 
engineering decisions, logs, runbooks, and project management 
functionality. Additionally, documents need to be version controlled 
with auditing capabilities, while being able to get a quick overview of 
outstanding tasks. It also needs to fit with existing workflows and come 
with minimal technical debt.

## Considered Options

- GitHub Projects
- Notion
- Plain-text only

## Decision Outcome

A Git repository hosted on GitHub, using a GitHub Projects page to track 
issues and outstanding tasks.

Git provides sound version control, and auditing controls with GPG 
signatures, and can efficiently store documentation, topology diagrams, 
ADRs, scripts, and other project related files. GitHub's issues can be 
used to track open tasks, investigations, and documentation updates, 
which can be centralised as a dashboard in the associated Project view. 

## Consequences

This works well with existing plain text work flows, while providing a 
reasonable format for public markdown files, and supports Serpentine's 
simple requirements for project management. Tools like Notion could also 
be used, however it would additional setup and maintenance overhead, 
while more than likely needing a Git component to support version 
control without a paid account.

## References

Project Log: 2026-06-06

