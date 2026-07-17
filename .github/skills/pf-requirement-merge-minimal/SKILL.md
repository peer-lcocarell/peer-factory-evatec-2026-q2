---
name: pf-requirement-merge-minimal
description: Merge overlapping requirement-level markdown test cases. Keep one authoritative file per scenario, retire duplicates, update audit, and minimize output.
argument-hint: "<requirement-folder> [publish yes/no] [PlanId] [SuiteId]"
user-invocable: true
---

# Goal
Consolidate overlapping test cases while preserving coverage.

# Input
- Requirement folder
- Optional publish flag
- Optional PlanId, SuiteId

# Process
1. Read `0*.md` and `req-*-audit.md`.
2. Ignore notes, backups, and non-test files.
3. Compare:
   - intent
   - requirement coverage
   - permissions
   - setup
   - actions/results
   - risk type
4. Classify:
   - Merge: duplicate or near-duplicate coverage
   - Separate: different requirement, permission boundary, negative path, or risk
5. Consolidate:
   - Select canonical file
   - Preserve all unique coverage
   - Retire redundant files
6. Update audit:
   - authoritative files
   - merged/retired mapping
   - gaps
7. Publish only if requested:
   - Dry run first
   - Publish after validation

# Rules
- Do not reduce coverage.
- Keep negative and positive paths separate when risk differs.
- Keep titles unchanged unless requested.
- No semicolons in test case prose.

# Output
Result
- before/after counts

Merged
- source → canonical

Kept Separate
- file
- reason

Audit Updated
- yes/no

Publish
- status (only if used)

If no merges exist:
- "No safe merges found."
- blockers only

# Ambiguity
Ask at most:
1. Preferred canonical file?
2. Minimize file count or preserve risk isolation?
