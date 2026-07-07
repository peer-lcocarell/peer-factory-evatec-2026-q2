<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# QA Test Case Writer Reusable Prompt Skill

Use this prompt with pf-qa-test-case-writer-agent-profile when creating manual test cases.

## Purpose

Enforce consistent CR-local file placement and ADO-friendly Markdown output for all generated test cases.

## Required Behavior

- Analyze provided requirements and CR scope before writing test cases.
- Detect the target CR ID from the request or current context.
- Place generated test cases in the CR test case directory for that CR.
- Generate one Markdown file per test case.
- Keep output compatible with ADO publishing scripts in this repository.

## File Placement

- Base pattern:
  - docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/<CR>/test-cases/
- Use the existing test-cases folder if present.
- If missing, create:
  - test-cases
- Do not place generated test cases outside the CR path.

## File Naming

- Use sortable numeric prefixes:
  - 001-<scenario-name>.md
  - 002-<scenario-name>.md
- Use lowercase and hyphenated names.
- Keep names concise and scenario-focused.

## ADO-Friendly Markdown Template

Every generated file must follow this exact section structure:

# Test Case Title

## Requirement

Requirement ID or CR reference.

## Preconditions

- Condition 1
- Condition 2

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Perform action | Verify result |

## Expected Outcome

Short summary.

## Constraints

- Do not use HTML tables.
- Do not omit required headers.
- Do not use alternate table formats.
- Use only information explicitly provided.
- If information is missing, state: Information not provided.

## Delivery Summary

After file generation, provide:

- Created file paths
- Scenario list
- Requirement coverage mapping
- Open questions and assumptions
