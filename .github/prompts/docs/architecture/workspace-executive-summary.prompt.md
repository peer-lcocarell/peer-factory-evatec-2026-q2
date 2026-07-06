---
mode: ask
description: "Executive-level workspace summary for technical leads onboarding to a project — covers architecture, tech stack, workflows, security, testing, and risks."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Prompt: Workspace Executive Summary

## Goal

Analyze the entire VS Code workspace and produce an executive-level summary for a technical lead onboarding to the project. The output must be concise but comprehensive — no file-by-file narration; focus on patterns, purpose, and risk.

## Input

- Full workspace (Copilot will scan all files and folders)
- Audience: technical lead, architect, or senior engineer new to the project

## Constraints

- Do not list every file — summarize patterns and highlight the most important ones.
- Keep each section focused; avoid padding.
- Flag gaps, missing documentation, or areas requiring follow-up.
- If a section has no findings, state "None identified" rather than omitting it.

## Analysis Focus Areas

Examine the workspace for:

- Application purpose and business function
- Overall architecture and major components
- Primary technologies, frameworks, languages, and libraries
- Key services, APIs, databases, and integrations
- Main application workflows and data flow
- Project structure and responsibilities of major folders
- Important configuration files and their purpose
- Authentication, authorization, and security mechanisms
- Build, deployment, CI/CD, and environment setup
- Testing strategy, frameworks, and coverage observations
- Technical debt, code quality concerns, and risks
- Notable design patterns and architectural decisions
- Dependencies that are business-critical or high-risk
- Areas that may require additional documentation

## Expected Output Format

Produce output using exactly these sections:

```markdown
# Workspace Overview
Brief description of what the solution does and its business purpose.

# Architecture Summary
High-level architecture and component relationships.

# Technology Stack
List of major technologies, frameworks, languages, and libraries.

# Project Structure
Explanation of key folders, projects, and modules with their responsibilities.

# Core Workflows
Summary of the most important business and technical flows.

# Integrations
External systems, APIs, databases, and services.

# Security & Compliance
Authentication, authorization, secrets management, and security observations.

# Testing & Quality
Testing approach, frameworks, coverage level, and quality indicators.

# Risks & Technical Debt
Potential issues, gaps, outdated dependencies, and maintainability concerns.

# Key Files to Review
List the most important files for a new developer to understand the system.
```

## Example

**Input:** A .NET API workspace with React frontend, Azure SQL, and GitHub Actions CI/CD.

**Output (partial):**

```markdown
# Workspace Overview
Order management API serving a React SPA. Handles product catalog, order lifecycle,
and customer notifications via Azure Service Bus.

# Technology Stack
- ASP.NET Core 8 (API)
- React 18 + TypeScript (frontend)
- Azure SQL (primary database)
- Azure Service Bus (async messaging)
- GitHub Actions (CI/CD)

# Risks & Technical Debt
- No integration tests for Service Bus consumers.
- Three NuGet packages pinned to EOL versions.
- `appsettings.Development.json` contains hardcoded connection strings — should use secrets.
```
