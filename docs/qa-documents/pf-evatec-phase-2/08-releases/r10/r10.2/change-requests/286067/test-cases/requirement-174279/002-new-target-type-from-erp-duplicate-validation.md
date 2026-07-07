# R10.2 Update for CR 286067 - New Target Type from ERP: Verify duplicate target type records are handled correctly during import (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- An import source contains records for a target type that already exists in the system.
- Business rules for duplicate handling are defined and documented.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Trigger ERP import that includes a target type record already present in the system. | Import starts. |
| 2 | Complete the import and review the summary output. | The summary indicates how the duplicate was handled (updated, skipped, or flagged per business rules). |
| 3 | Open the 'Targets' page and search for the affected target type. | The record reflects the outcome defined by business rules (updated fields or unchanged). |
| 4 | Verify no unintended duplicate target type records are present in the list. | The target type list contains the record once only. No duplicate entries are visible. |

## Expected Outcome
Duplicate target type records during ERP import are handled according to defined business rules. No unintended duplicate target type records are created. The import summary accurately reports the duplicate handling outcome.
