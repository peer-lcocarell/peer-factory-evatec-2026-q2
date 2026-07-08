# R10.2 Update for CR 284111 - New Box: Verify WBS required, format, length, and regeneration validation (Negative)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36298
Requirement: Self-Service New Box save is blocked for missing or invalid WBS values; WBS supports max length 60 and invalid values are regenerated from Work Order.

## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least two active Work Orders with different work order numbers are available.
- User is on `Boxes > Create New Box` page with validation messages enabled.
- Required non-WBS fields can be populated with valid values.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Complete mandatory base fields, select Work Order, and set `From Self-Serve Station` to `Yes`. | WBS Element is visible and required. |
| 2 | Clear WBS Element and attempt to save. | Save is blocked and required-field validation is shown for WBS Element. |
| 3 | Enter invalid WBS format (for example wrong suffix pattern) and attempt to save. | Save is blocked and format validation is shown. |
| 4 | Enter WBS value longer than 60 characters and attempt to save. | Save is blocked (or input is constrained) to enforce maximum length of 60 characters. |
| 5 | Enter a WBS value with a valid suffix but mismatched prefix compared to selected Work Order and attempt to save. | Save is blocked or value is corrected before save; mismatched prefix is not accepted for persistence. |
| 6 | Enter an invalid WBS value, then change Work Order to a different one. | WBS value is regenerated to valid default format with new prefix `[WorkOrderNumber].00.00`. |
| 7 | Save with regenerated valid WBS and reopen record. | Save succeeds and persisted WBS matches valid regenerated value only. |
| 8 | Return to list and reopen the same record. | Persisted WBS remains valid and unchanged; no previously invalid value is stored. |

## Expected Outcome
New Box validation blocks invalid Self-Service saves for missing, malformed, oversized, or Work Order-mismatched WBS values, and Work Order changes regenerate valid defaults before successful persistence.
