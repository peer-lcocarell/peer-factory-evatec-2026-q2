# R10.2 Update for CR 286836 - Import Work Orders from File: Verify error message is displayed for missing mandatory work order fields (Negative)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 272565
Requirement: Import work orders from file (Work Orders)

## Preconditions
- User is signed in with permissions to import and view Work Orders.
- A work order file is available with missing mandatory fields.
- Existing work order data is present for regression check.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Work Orders import screen. | Import controls are visible and enabled. |
| 2 | Select invalid file with missing mandatory fields and start import. | Import is blocked or records fail validation. |
| 3 | Review validation output. | Clear error message identifies missing mandatory fields. |
| 4 | Verify existing work orders after failure. | Existing work order data remains unchanged. |

## Expected Outcome
System reports missing mandatory work order fields clearly and prevents invalid records from being imported.
