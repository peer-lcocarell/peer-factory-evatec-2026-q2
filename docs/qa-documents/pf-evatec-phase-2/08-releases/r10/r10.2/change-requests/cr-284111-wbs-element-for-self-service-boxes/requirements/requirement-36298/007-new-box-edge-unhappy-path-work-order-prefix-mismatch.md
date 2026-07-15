# R10.2 284111 Self-Service Box - New Box Work Order Prefix Mismatch Handling (Unhappy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36298
- Requirement: WBS must stay consistent with selected Work Order; stale/mismatched values are rejected or regenerated.

## Preconditions

- User is signed in with `Boxes_Create` permission.
- At least two active Work Orders exist with different external IDs (A and B).
- User is on `Boxes > Create New Box`.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Select `Self-Serve = Yes` and choose Work Order A. | WBS auto-generates with Work Order A prefix. |
| 2 | Manually edit WBS to a mismatched prefix for Work Order A. | Value is accepted in field but marked invalid on validation/save attempt. |
| 3 | Click Save with mismatched WBS. | Save is blocked with deterministic validation message. |
| 4 | Change Work Order to B. | WBS is regenerated/updated to Work Order B prefix default. |
| 5 | Keep regenerated valid WBS and complete required fields. | Save succeeds. |
| 6 | Open saved record. | Persisted WBS prefix matches selected Work Order B. |

## Expected Outcome

System prevents saving mismatched WBS prefixes and ensures persisted WBS remains consistent with selected Work Order.
