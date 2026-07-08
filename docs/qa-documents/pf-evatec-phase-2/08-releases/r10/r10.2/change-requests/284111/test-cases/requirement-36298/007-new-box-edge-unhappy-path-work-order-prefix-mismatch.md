# R10.2 Update for CR 284111 - New Box: Verify Work Order prefix mismatch handling for WBS (Edge Negative)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36298
Requirement: In New Box flow, WBS must remain valid for the selected Work Order; invalid or stale values are regenerated to `[WorkOrderNumber].00.00` and invalid save must not persist inconsistent data.

## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least two active Work Orders exist with different work order numbers (for example `WO10001` and `WO20002`).
- User is on `Boxes > Create New Box` page.
- Required base fields (Owner, Location, Shelf, Work Order) are available and selectable.
- Validation messages are enabled in the test environment.
- Existing test data allows full completion of New Box flow without unrelated validation blockers.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Start New Box, complete mandatory base fields, select Work Order `WO10001`, and set `From Self-Serve Station` to `Yes`. | WBS Element is visible, required, and uses `WO10001` prefix. |
| 2 | Replace WBS with a value that uses a different prefix (for example `WO20002.12.34`) while Work Order is still `WO10001`. | WBS is now inconsistent with selected Work Order and considered invalid for save. |
| 3 | Attempt to save without correcting Work Order/WBS mismatch. | Save is blocked or WBS is auto-regenerated before save; inconsistent prefix is not persisted. |
| 4 | Keep same work order and manually correct WBS to `WO10001.00.00`, then save. | Save succeeds and record persists with prefix aligned to `WO10001`. |
| 5 | Create another new record: select Work Order `WO10001`, set Self-Service to `Yes`, then switch Work Order to `WO20002`. | WBS default regenerates to valid format with new prefix (for example `WO20002.00.00`). |
| 6 | Save second record and reopen in View/Edit mode. | Saved WBS matches selected Work Order prefix only; no stale prefix value is stored. |
| 7 | Return to list and open both created records. | Each record retains a WBS prefix that matches its own selected Work Order. |

## Expected Outcome
New Box flow prevents persistence of Work Order/WBS prefix mismatch values, regenerates defaults when Work Order changes, and stores only prefix-consistent WBS data.
