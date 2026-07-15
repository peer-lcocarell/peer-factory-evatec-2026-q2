# R10.2 Update for CR 286836 - Import Work Orders from File: Verify Closed and Locked statuses normalize to Closed (Validation)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 272565
Requirement: Import work orders from file (Work Orders)

## Preconditions
- User is signed in with `ERP_View` and `ERP_Edit` permissions.
- Import file contains work orders with `Closed`, `Locked`, and non-closed statuses.
- Work Orders import page is accessible.
- Existing work orders are available for comparison.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Work Orders import page and select valid format and file. | File and format are accepted without validation errors. |
| 2 | Run import and wait for completion. | Import completes successfully with summary counts. |
| 3 | Open imported records that were `Closed` in the source file. | Imported status is displayed as `Closed`. |
| 4 | Open imported records that were `Locked` in the source file. | Imported status is displayed as `Closed`. |
| 5 | Open imported records with other source statuses. | Non-closed statuses remain mapped as expected by format rules. |

## Expected Outcome
The tester verifies that source statuses `Closed` and `Locked` are normalized to `Closed` after import, while other statuses remain correctly mapped.
