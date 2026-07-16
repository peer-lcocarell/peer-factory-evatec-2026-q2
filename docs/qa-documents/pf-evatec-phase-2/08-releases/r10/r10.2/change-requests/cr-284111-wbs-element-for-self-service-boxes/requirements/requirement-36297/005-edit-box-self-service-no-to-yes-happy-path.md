# R10.2 284111 Self-Service Box - Edit Box Self-Service No to Yes and Work Order Change (Happy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36297
- Requirement: Editing a box to Self-Service = Yes makes WBS visible and required; changing Work Order updates WBS prefix.

## Preconditions

- User is signed in with `Boxes_Edit` and `Boxes_View` permissions.
- An existing active box with `IsSelfServe = false` is available.
- At least two active Work Orders with distinct external IDs exist.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing non-self-service box in edit mode. | Box opens and WBS field is not visible. |
| 2 | Change `Is Self-Serve` to `Yes`. | WBS Element field becomes visible and required. |
| 3 | Select Work Order A. | WBS auto-populates as `{ExternalIdA}-##-##`. |
| 4 | Change Work Order to B. | WBS updates to `{ExternalIdB}-##-##`. |
| 5 | Complete any remaining required fields and save. | Save succeeds. |
| 6 | Re-open the saved box in view mode. | `Is Self-Serve = Yes` and WBS shows Work Order B prefix. |
| 7 | Return to list and locate the record. | Box shows `Self-Service = Yes`. |

## Expected Outcome

Toggling an existing box to Self-Service = Yes and changing the Work Order correctly generates and updates WBS, persisting the final value.
