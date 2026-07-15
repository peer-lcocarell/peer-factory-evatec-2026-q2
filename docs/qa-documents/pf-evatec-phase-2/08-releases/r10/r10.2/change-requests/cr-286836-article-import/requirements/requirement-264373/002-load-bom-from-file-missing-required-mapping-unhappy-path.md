# R10.2 Update for CR 286836 - Load BOM from File: Verify validation is displayed when required mapping is missing (Unhappy Path)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 264373
Requirement: Load BOM from File (Import Hardware Configuration)

## Preconditions
- User is signed in with permission to access BOM import.
- A custom format exists with one required mapping intentionally missing.
- A BOM file is available for import.
- Existing BOM records are available for regression comparison.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open import format management for BOM import. | Format management is accessible. |
| 2 | Configure or select a custom format with a missing required mapping. | Format is flagged as invalid or save is blocked based on validation rules. |
| 3 | Attempt BOM import using the invalid mapping format. | Import is blocked and clear validation message is displayed. |
| 4 | Review validation details. | Validation identifies missing required mapped header. |
| 5 | Verify existing BOM records after blocked import. | Existing records are unchanged and no invalid partial import data is persisted. |
| 6 | Correct mapping and rerun import with same file. | Import succeeds with corrected mapping. |

## Expected Outcome
The tester verifies that the system prevents BOM import when required mapping is missing, provides actionable validation feedback, and preserves existing data integrity.
