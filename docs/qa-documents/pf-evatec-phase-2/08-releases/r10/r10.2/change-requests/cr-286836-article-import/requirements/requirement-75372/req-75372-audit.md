# Audit - Requirement 75372

## Requirement Reference

- CR: 286836
- Ticket: 34948
- Requirement ID: 75372
- Requirement: Edit ERP hardware component

## Requirement Summary

- User can edit imported ERP comments.
- Save persists updates.
- Cancel closes without saving.
- User must have `ERP_Edit` right.
- User with `ERP_Edit` can toggle the `Deleted` state for one or more hardware components.

## Existing Test Coverage

- 001-edit-erp-hardware-component-happy-path.md
- 002-edit-erp-hardware-component-unhappy-path-required-fields.md
- 003-edit-erp-hardware-component-regression-persistence.md
- 004-edit-erp-hardware-component-bulk-deleted-toggle-validation.md

## Coverage Assessment

- Happy path coverage: Present.
- Unhappy path validation coverage: Present.
- Regression persistence coverage: Present.
- Bulk toggle behavior coverage for multiple selected records: Present.
- Permission-focused unhappy path coverage: Missing.

## Recommendations

- Add a permissions unhappy path test for missing `ERP_Edit`.


