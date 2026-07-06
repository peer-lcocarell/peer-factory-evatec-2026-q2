# R10.2 Update for CR 286067 - New Target Type from ERP: Verify duplicate target type records are handled correctly during import (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with permissions to import ERP hardware components and view targets.
- Import source contains duplicate target type records.
- Business rules for duplicate handling are defined.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Trigger ERP import that includes duplicate target type records. | Import starts successfully. |
| 2 | Complete import and review summary output. | Summary indicates how duplicates were handled. |
| 3 | Open Targets and search for the affected article/target type. | Records reflect create/update/skip according to business rules. |
| 4 | Verify no unintended duplication is present in the target type list. | Target type list remains consistent without duplicates. |

## Expected Outcome
Duplicate target type records during ERP import are handled per defined rules with no unintended duplication.
