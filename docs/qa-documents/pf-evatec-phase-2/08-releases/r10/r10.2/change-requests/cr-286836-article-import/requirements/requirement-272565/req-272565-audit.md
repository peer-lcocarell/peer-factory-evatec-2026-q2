# Audit - Requirement 272565

## Requirement Reference

- CR: 286836
- Ticket: 34948
- Requirement ID: 272565
- Requirement: Import work orders from file

## Requirement Summary

- Work Orders import supports multiple file formats.
- User selects format and file for import.
- Required mappings are `Project #` and `Name`.
- Optional mappings include `Project Type`, `Status`, and additional fields.
- Closed and Locked statuses are normalized to Closed.
- Import summary displays added, updated, and skipped counts.
- User must have `ERP_View` and `ERP_Edit` rights.

## Existing Test Coverage

- 001-import-work-orders-valid-file-happy-path.md
- 002-import-work-orders-missing-mandatory-fields-unhappy-path.md
- 003-import-work-orders-regression-availability.md
- 004-import-work-orders-closed-locked-status-normalization-validation.md

## Coverage Assessment

- Happy path coverage: Present.
- Mandatory field unhappy path coverage: Present.
- Downstream availability regression coverage: Present.
- Closed and Locked normalization coverage: Present.
- Permission matrix coverage: Missing.
- Custom format management coverage: Missing.

## Recommendations

- Add permission tests for missing `ERP_View` or `ERP_Edit`.
- Add custom format creation and validation tests.

