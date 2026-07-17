# QA Audit: Requirement 290756 - Magnet System Types

## Status

Consolidation completed on 2026-07-17.

The requirement folder now uses one authoritative test case per scenario group.

## Authoritative Test Cases

- 001-magnet-system-types-list-happy-path.md
- 002-magnet-system-types-list-permission-denied-negative.md
- 003-create-magnet-system-type-happy-path.md
- 004-edit-magnet-system-type-happy-path.md
- 006-promote-prototype-to-standard-from-list.md

## Merged and Retired Files

- Merged into 002: 003-list-not-accessible-without-view-permission.md
- Merged into 003: 004-create-new-magnet-system-type-from-list.md
- Merged into 004: 005-edit-magnet-system-type-from-list.md
- Merged into 006: 005-define-prototype-as-standard-happy-path.md

## Coverage Summary

### Covered

- List page access for users with view rights.
- Core list display, column presence checks, and basic sort or filter behavior.
- Security denial for users without MagnetSystemTypes_View, including direct URL checks.
- Create flow from list entry point with ERP article precondition.
- Edit flow from list to detail with save verification.
- Read-only detail verification for users without edit rights.
- Prototype to Standard promotion with positive and negative permission checks.

### Remaining Gaps

- Explicit validation for every required list field token in one deterministic assertion set:
  - Variant Code
  - Source Type
  - Flexicat Type
  - Applications
  - Successor
  - Description
- Explicit ERP Status multi-value filtering behavior.
- Explicit URL preservation assertions for sorting and filtering after refresh and share.

## Recommendation

Keep the current five-file set as authoritative and add targeted non-overlapping tests only for the listed remaining gaps.
