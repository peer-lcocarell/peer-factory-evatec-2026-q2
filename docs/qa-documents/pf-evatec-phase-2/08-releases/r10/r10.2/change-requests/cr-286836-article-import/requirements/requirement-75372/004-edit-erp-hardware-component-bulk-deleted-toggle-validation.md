# R10.2 Update for CR 286836 - Edit ERP Hardware Component: Verify bulk Deleted toggle updates all selected records consistently (Validation)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 75372
Requirement: Edit ERP hardware component (Hardware Components)

## Preconditions
- Tester is signed in with `ERP_Edit` permission.
- At least three editable ERP hardware component records exist.
- Selected records include mixed initial `Deleted` states.
- Hardware Components list supports multi-select actions.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Components and select multiple ERP records. | Multi-selection is active for selected rows. |
| 2 | Execute bulk toggle action for `Deleted`. | Bulk action executes without row-level errors. |
| 3 | Save changes. | Save succeeds and success confirmation is displayed. |
| 4 | Re-open each selected record. | Each selected record's `Deleted` field displays the opposite state from the baseline value recorded before the bulk toggle. |
| 5 | Review one non-selected record. | Non-selected record remains unchanged. |

## Expected Outcome
The tester verifies that bulk `Deleted` toggle updates all selected records consistently and does not affect non-selected records.
