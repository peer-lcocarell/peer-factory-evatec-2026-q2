# R10.2 Update for CR 286067 - New Target Type from ERP: Verify duplicate target type records are handled correctly during import (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- An import source contains records for a target type that already exists in the system.
- Business rules for duplicate handling are defined and documented, including the expected outcome for duplicate Article Number records.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Record baseline values for the existing target type (Article Number, Name, and one additional mapped field) and note current list count for that Article Number. | Baseline values and count are documented before import. |
| 2 | Trigger ERP import that includes a duplicate record for the same Article Number. | Import starts and completes successfully. |
| 3 | Review the import summary output for the duplicate record. | The duplicate outcome matches the documented business rule for this scenario (for example: skipped, flagged, or updated). |
| 4 | Open the 'Targets' page and search by the duplicate Article Number. | Exactly one target-type record is returned for the Article Number. |
| 5 | Compare resulting field values to baseline and expected duplicate rule outcome. | Field values match the documented expected behavior for the duplicate rule and do not show unintended changes. |
| 6 | Refresh and reopen the 'Targets' page and repeat the duplicate Article Number search. | Duplicate handling result persists and record count remains one. |

## Expected Outcome
Duplicate ERP target-type imports are handled deterministically according to documented rules for duplicate Article Number records. Only one record exists after import, and the persisted field values match the expected rule outcome.
