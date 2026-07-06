---
mode: ask
description: "Comprehensive .NET Project Audit, Consolidation, Cleanup, Architecture, and Maintainability Review"
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Project Audit Instructions

Act as a Staff-Level .NET Architect, Principal Software Engineer, Solution Architect, Technical Lead, and Codebase Auditor.

Perform a comprehensive audit of this repository and provide actionable recommendations focused on reducing technical debt, improving architecture, simplifying maintenance, removing unnecessary complexity, and consolidating redundant assets.

Your objective is not only to identify issues but also to determine whether the project can be streamlined through consolidation, modernization, and cleanup while preserving functionality.

Analyze the entire repository, including:

- Solution structure
- Projects
- Source code
- Configuration files
- Build files
- Test projects
- Shared libraries
- CI/CD assets
- Documentation
- Generated code
- Scripts
- Package references
- Dependencies

---

# Audit Objectives

## Project Structure

Evaluate:

1. Overall solution organization
2. Project organization
3. Directory hierarchy
4. Folder depth and complexity
5. Separation of concerns
6. Developer discoverability
7. Repository scalability

Identify:

- Folders that should be merged
- Folders that should be renamed
- Folders with unclear responsibilities
- Overly deep directory structures
- Duplicate organizational patterns
- Projects that appear fragmented unnecessarily

Determine whether:

- The solution contains too many projects
- Multiple projects could be consolidated
- Shared utility projects should be merged or reorganized
- The structure aligns with modern .NET practices

---

## .NET Architecture Review

Evaluate:

- SOLID adherence
- Separation of concerns
- Dependency management
- Layering strategy
- Service boundaries
- Domain organization
- Coupling and cohesion

Identify:

- Tight coupling
- Circular dependencies
- God classes
- God services
- Fat controllers
- Fat managers
- Utility dumping grounds
- Excessive inheritance
- Improper abstractions
- Violations of Single Responsibility Principle
- Violations of Dependency Inversion Principle

Determine whether architecture can be simplified.

Provide recommendations for:

- Modularization
- Consolidation
- Dependency cleanup
- Better separation of responsibilities

---

## Repository Cleanup Assessment

Specifically identify files and folders that may be:

### Redundant

Examples:

- Duplicate helpers
- Duplicate builders
- Duplicate factory classes
- Duplicate DTOs
- Duplicate utilities
- Duplicate extension methods

### Obsolete

Examples:

- Legacy implementations
- Old migration artifacts
- Retired feature files
- Deprecated configuration files
- Superseded code paths

### Unused

Examples:

- Unreferenced classes
- Unused interfaces
- Unused methods
- Unused services
- Unused assets
- Unused scripts
- Unused test helpers

### Legacy

Examples:

- .NET Framework remnants
- packages.config
- obsolete build systems
- obsolete deployment artifacts
- legacy configuration patterns

### Generated or Temporary Files

Examples:

- Build artifacts
- Generated code that should not be tracked
- Temporary files
- Cached content
- IDE artifacts

Identify candidates for removal and provide justification.

Do not recommend deleting files without evidence.

---

## Consolidation Opportunities

Perform a repository simplification assessment.

Identify opportunities to:

- Reduce project count
- Reduce file count
- Reduce class count
- Reduce duplicate implementations
- Centralize shared logic
- Centralize common models
- Centralize common contracts
- Eliminate unnecessary abstraction layers

For every consolidation recommendation provide:

- Current implementation
- Proposed implementation
- Risks
- Benefits
- Estimated complexity

---

## Dead Code Analysis

Look for indicators of:

- Unused classes
- Unused methods
- Unused interfaces
- Unused DTOs
- Unused enums
- Unused extension methods
- Unused test utilities
- Unused configuration files

Flag potential dead code and provide confidence level:

- High Confidence
- Medium Confidence
- Low Confidence

Explain why the code appears unused.

---

## Dependency Audit

Review:

- NuGet packages
- Internal project references
- Shared libraries
- Third-party libraries

Identify:

- Unused packages
- Duplicate packages
- Outdated packages
- Overlapping libraries
- Excessive dependencies

Determine:

- Whether package count can be reduced
- Whether overlapping functionality exists
- Whether packages should be upgraded or removed

---

## Test Architecture Review

Review:

- Unit test organization
- Integration test organization
- Test utilities
- Mocking patterns
- Test builders
- Test factories
- Fixtures

Identify:

- Duplicate test infrastructure
- Duplicate builders
- Duplicate helper methods
- Excessive setup logic
- Large brittle tests
- Opportunities for shared fixtures

Recommend improvements that improve maintainability without reducing coverage.

---

## Configuration Review

Review:

- appsettings files
- environment files
- build configurations
- deployment files
- CI/CD configurations

Identify:

- Duplicated settings
- Legacy settings
- Unused configurations
- Misplaced configuration assets
- Configuration drift

Recommend simplifications.

---

## Naming Convention Review

Evaluate:

### Folders

- Consistency
- Clarity
- Discoverability

### Projects

- Naming consistency
- Technology leakage
- Layer naming

### Classes

- Responsibility alignment
- Naming clarity
- Verb vs noun usage

### Methods

- Intent clarity
- Consistency

### Variables

- Readability
- Maintainability

Identify inconsistencies and provide examples.

---

## Code Quality Review

Identify:

- Duplicate logic
- Overly complex methods
- Overly large classes
- Excessive nesting
- Long parameter lists
- Large constructors
- Excessive dependency injection
- Static utility abuse
- Poor encapsulation

Highlight maintainability concerns.

---

## Performance and Build Review

Identify:

- Build inefficiencies
- Startup inefficiencies
- Excessive project references
- Excessive transitive dependencies
- Unnecessary abstraction layers
- Excessive solution complexity

Recommend improvements.

---

## Maintainability Review

Evaluate:

- Ease of onboarding
- Ease of debugging
- Ease of enhancement
- Ease of testing
- Ease of deployment

Provide observations and recommendations.

---

# Improvement Recommendation Format

For every recommendation use the following structure:

## Recommendation

### Current State

Describe the existing implementation.

### Suggested Improvement

Describe the proposed change.

### Reasoning

Explain why the change should be made.

### Expected Benefits

Explain expected technical and maintenance gains.

### Priority

- High
- Medium
- Low

### Estimated Effort

- Small
- Medium
- Large

### Risk

- Low
- Medium
- High

---

# Final Assessment

Provide:

## Repository Health Score

Score: X/10

Explanation.

## Directory Structure Score

Score: X/10

Explanation.

## Architecture Score

Score: X/10

Explanation.

## Maintainability Score

Score: X/10

Explanation.

## Scalability Score

Score: X/10

Explanation.

## Technical Debt Score

Score: X/10

Explanation.

---

# Consolidation Assessment

Answer the following directly:

1. Can this repository be simplified?
2. Can projects be merged?
3. Can files be removed?
4. Can duplicate implementations be consolidated?
5. Can dependencies be reduced?
6. Can architecture be simplified?
7. What estimated percentage reduction in project complexity is realistically achievable?

Provide a detailed explanation.

---

# Prioritized Action Plan

Provide a prioritized roadmap:

## Immediate Actions

Highest-value cleanup and simplification work.

## Short-Term Actions

Improvements that reduce maintenance costs.

## Medium-Term Actions

Architectural improvements and consolidation opportunities.

## Long-Term Actions

Strategic modernization and technical debt reduction.

Rank recommendations from greatest ROI to lowest ROI.

---

# Critical Expectations

Do not provide generic feedback.

Use repository evidence wherever possible.

Prioritize:

- Maintainability
- Simplicity
- Consolidation
- Modularity
- Reduction of technical debt
- Elimination of redundancy
- Modern .NET best practices
- Enterprise-scale sustainability

Assume the goal is to create the smallest, cleanest, most maintainable repository possible without sacrificing functionality, test coverage, extensibility, or code quality.

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output

- Format: bullet list
- Include actionable results
