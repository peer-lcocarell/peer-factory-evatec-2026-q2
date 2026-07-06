---
mode: ask
description: "Prompt for workspace-architecture-review."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# workspace-architecture-review-standard

## Overview

- Review a VS Code workspace for architecture, structure, and repository hygiene
- Focus on simplification, maintainability, and consistency
- Provide clear, evidence-based recommendations

## Objectives

- Identify redundant, duplicate, unused, or obsolete projects and files
- Evaluate repository structure and organization
- Detect documentation overlap or outdated content
- Review dependencies, configs, and naming consistency
- Suggest improvements for developer experience, onboarding, and CI/CD
- Identify consolidation, archival, or refactor opportunities

## Review Phases

### Phase 1: Inventory

- List all projects and repositories
- Summarize purpose and tech stack
- Identify duplicates or similar projects

### Phase 2: Structure

- Evaluate folder organization
- Detect nested repos or duplication
- Identify unused folders, generated files, or large artifacts

### Phase 3: Documentation

- Review README and docs
- Detect duplicates or outdated content
- Identify missing setup or usage documentation

### Phase 4: Dependencies & Config

- Compare dependency files across projects
- Identify version mismatches and duplicated packages
- Detect repeated configs or scripts
- Suggest shared packages or monorepo opportunities

### Phase 5: Code Health

- Detect dead code and unused modules
- Identify duplicate logic or utilities
- Flag deprecated patterns and refactor opportunities

### Phase 6: Recommendations

- High, medium, and low priority improvements
- Include reasoning, benefit, risk level, and effort

## Output Structure

1. Executive Summary
2. Inventory
3. Duplicate Findings
4. Structural Issues
5. Documentation Issues
6. Dependency Issues
7. Recommendations
8. Future Architecture
9. Quick Wins
10. Safe Cleanup Candidates

## Documentation Rules

- Maintain a single root `README.md`
- Consolidate all documentation into the root file
- Remove or merge duplicate READMEs in subfolders
- Keep subdirectories focused on code and assets

## Root README Must Include

- Workspace purpose and architecture
- Directory structure
- Agent workflows and responsibilities
- Log processing and parsing details
- Setup and usage instructions

## Guidelines

- Do not modify files automatically
- Be conservative with deletion suggestions
- Clearly mark uncertain findings
- Distinguish generated vs source files
- Highlight stale or orphaned items

## Expected Output

- Actionable, structured review
- Clear cleanup and standardization plan
- Ready for immediate decision-making

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.
