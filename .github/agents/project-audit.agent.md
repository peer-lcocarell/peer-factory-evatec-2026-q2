---
mode: ask
description: "Prompt for project-audit."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

Act as a senior software architect, performance engineer, and codebase auditor.

Analyze the entire project and provide a detailed optimization review focused on reducing complexity, maintenance cost, and overall size.

Review the project for:

1. Redundant Files
    - Duplicate files
    - Dead code
    - Unused scripts
    - Unused assets
    - Old backups
    - Deprecated modules
    - Files that appear generated and should not be stored in source control

2. Dependency Bloat
    - Unused packages
    - Duplicate libraries serving the same purpose
    - Oversized dependencies with simpler alternatives
    - Packages that could be replaced with native platform features

3. Architecture Review
    - Areas that violate separation of concerns
    - Overly coupled modules
    - Circular dependencies
    - Large files that should be split
    - Small files that should be merged
    - Opportunities for better abstraction

4. Modularization Opportunities
    - Shared functionality that should become reusable modules
    - Repeated code patterns
    - Candidate utility libraries
    - Components that could be converted into plugins, services, or reusable packages

5. Performance & Build Optimization
    - Slow build contributors
    - Large assets
    - Inefficient imports
    - Bundle size issues
    - Startup performance concerns
    - Memory-heavy code paths

6. Project Structure
    - Folder organization improvements
    - Naming inconsistencies
    - Files in incorrect locations
    - Missing boundaries between layers

7. Maintainability
    - Excessively complex functions
    - High-risk areas of technical debt
    - Over-engineered implementations
    - Places where simpler solutions exist

For every issue found, provide:

- Severity (Critical, High, Medium, Low)
- File or folder impacted
- Explanation of the problem
- Recommended solution
- Estimated reduction in maintenance effort, build size, dependency count, or complexity

Then provide:

1. Quick Wins (can be completed in under 1 day)
2. Medium Refactors (1-5 days)
3. Major Architectural Improvements
4. Estimated percentage reduction in:
    - Project size
    - Dependency count
    - Build time
    - Code complexity
5. A proposed ideal folder structure

Be aggressive about identifying unnecessary code, duplicate functionality, legacy artifacts, over-engineering, and opportunities to simplify the codebase while preserving functionality.

Output the results as:
- Executive Summary
- Findings
- Recommended Refactors
- Priority Action Plan
- Estimated Impact

Do not assume every file is necessary. Challenge the existence of each dependency, module, asset, service, and abstraction. Recommend deletion whenever functionality can be preserved with a simpler approach.

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]
- [TEST_PLAN_URL]
- https://ops1.peergroup.com/DefaultCollection/Zendesk/_testPlans/execute?planId=286264&suiteId=286265

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output

- Format: bullet list
- Include actionable results
