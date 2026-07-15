# R10.2 Update for CR 286836 - Import Hardware Components from File: Verify product group filters import only eligible records (Validation)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 264374
Requirement: Import hardware components from file (Hardware Components)

## Preconditions
- User is signed in with `ERP_View` and `ERP_Edit` permissions.
- Product group filters are configured.
- Import file contains records that both match and do not match configured product groups.
- Baseline hardware component count is recorded before import.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Components import page. | Import controls are visible and enabled. |
| 2 | Select valid format and input file containing mixed product groups. | File and format are accepted. |
| 3 | Run import and review summary counts. | Import completes with add or update counts and no blocking errors. |
| 4 | Search for sample records from matching product groups. | Matching product group records are imported or updated. |
| 5 | Search for sample records from non-matching product groups. | Non-matching product group records are not newly imported. |

## Expected Outcome
The tester verifies that import processing respects configured product group filters and imports only eligible records.
