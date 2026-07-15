# Audit - Requirement 264374

## Requirement Reference

- CR: 286836
- Ticket: 34948
- Requirement ID: 264374
- Requirement: Import hardware components from file

## Requirement Summary

- Import supports multiple file formats.
- Default format remains available.
- User selects format and file for import.
- Product group filtering applies.
- Linked Target Type and Magnet System Type name and status are updated.
- Import summary displays added, updated, and skipped counts.
- User must have `ERP_View` and `ERP_Edit` rights.

## Existing Test Coverage

- 001-import-hardware-components-valid-file-happy-path.md
- 002-import-hardware-components-invalid-format-unhappy-path.md
- 003-import-hardware-components-duplicate-handling-validation.md
- 004-import-hardware-components-product-group-filter-validation.md

## Coverage Assessment

- Happy path coverage: Present.
- Invalid format unhappy path coverage: Present.
- Duplicate handling coverage: Present.
- Product group filter validation: Present.
- Permission coverage for missing `ERP_View` or `ERP_Edit`: Missing.
- Import summary field-level validation: Partial.

## Recommendations

- Add permission matrix tests.
- Add explicit summary count validation for added, updated, and skipped values.

