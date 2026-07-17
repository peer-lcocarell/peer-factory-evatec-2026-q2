# QA Audit: Requirement 290757 - New Magnet System Type

## Status

Consolidation completed on 2026-07-17.

The requirement folder now uses one authoritative test case per scenario group with overlap removed.

## Authoritative Test Cases

- 001-new-magnet-system-type-happy-path.md
- 002-new-magnet-system-type-negative.md
- 003-new-magnet-system-type-applications-field-multi-value.md
- 004-new-magnet-system-type-article-used-as-target-type-negative.md
- 005-new-magnet-system-type-existing-magnet-system-type-negative.md

## Merged and Retired Files

- Merged into 003: 004-applications-field-multiple-selections.md
- Merged into 004: 005-erp-article-used-as-target-type-excluded.md
- Merged into 005: 006-erp-article-used-as-magnet-system-type-excluded.md

## Coverage Summary

### Covered

- Valid creation flow from ERP article selection.
- Required field validation for Source Type, FlexiCat Type, and Applications.
- Multi-selection behavior for predefined Application values.
- Exclusion rule when ERP article is already used as Target Type.
- Exclusion rule when ERP article is already used as Magnet System Type.
- Positive continuation path with eligible ERP article after blocked selection.

### Remaining Gaps

- Explicit deterministic read-only checks for ERP-derived fields:
	- Article #
	- Name
	- ERP Status
	- Successor
- Description maximum length boundary validation (500 and 501 characters).
- Cancel confirmation workflow validation (Yes exits without creation, No continues editing).
- Explicit security denial for users without `MagnetSystemTypes_Edit`.

## Recommendation

Keep the current five-file set as authoritative.

If further expansion is needed, add only targeted non-overlapping tests for the listed remaining gaps.

