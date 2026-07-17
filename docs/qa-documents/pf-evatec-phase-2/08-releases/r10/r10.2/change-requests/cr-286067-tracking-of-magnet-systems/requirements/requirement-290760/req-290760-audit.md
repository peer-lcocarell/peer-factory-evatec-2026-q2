# QA Audit: Requirement 290760 - Edit Magnet System Type

## Status

Consolidation completed on 2026-07-17.

The requirement folder now uses one authoritative test case per scenario group with overlap removed.

## Authoritative Test Cases

- 001-edit-magnet-system-type-happy-path.md
- 002-edit-magnet-system-type-prototype-readonly-fields.md
- 003-edit-magnet-system-type-cancel-with-unsaved-changes.md
- 004-edit-magnet-system-type-back-button-behavior.md
- 005-edit-magnet-system-type-save-button-availability.md
- 006-edit-magnet-system-type-prevent-access-without-edit-permission.md

## Merged and Retired Files

- Merged into 002: 004-erp-sourced-fields-readonly-on-prototype-edit.md
- Merged into 003: 005-cancel-edit-does-not-persist-changes.md
- Merged into 004: 006-back-button-returns-to-detail-page.md
- Merged into 005: 007-save-button-enabled-only-on-valid-change.md
- Merged into 006: 008-edit-action-not-available-without-permission.md

## Coverage Summary

### Covered

- Standard edit happy path and persistence verification.
- Prototype edit read-only constraints including Variant Code, Predecessor, Source Type, FlexiCat Type, and ERP-sourced fields.
- Cancel with unsaved changes confirmation behavior, return-to-edit option, and no-persist confirmation path.
- Back button behavior in no-change state and transition to Cancel after modifications.
- Save button enablement only when valid changes are present and disablement when values revert.
- Security enforcement for users without `MagnetSystemTypes_Edit`, including blocked direct URL edit access.

### Remaining Gaps

- Explicit invalid-edit rule checks inherited from create rules:
  - changed-invalid state keeps Save unavailable
  - required-field and format validation in edit mode
- Explicit conflict-handling scenario for concurrent edits.
- Explicit post-edit history entry verification.

## Recommendation

Keep the current six-file set as authoritative and add only targeted non-overlapping tests for the listed remaining gaps.

