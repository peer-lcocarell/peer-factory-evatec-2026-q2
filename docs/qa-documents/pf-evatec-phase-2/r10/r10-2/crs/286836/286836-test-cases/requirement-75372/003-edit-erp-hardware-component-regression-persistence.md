# R10.2 Update for CR 286836 - Edit ERP Hardware Component: Verify existing hardware component data is retained after save (Regression)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 75372
Requirement: Edit ERP hardware component (Hardware Components)

## Preconditions
- User is signed in with permissions to view and edit Hardware Components.
- Existing ERP hardware component data is present.
- User can re-open the same record after saving.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an ERP hardware component and note current key field values. | Baseline values are recorded. |
| 2 | Change a limited set of editable fields and save. | Save succeeds. |
| 3 | Re-open the same hardware component. | Updated fields show new values. |
| 4 | Verify unchanged fields. | Fields not edited retain original values. |

## Expected Outcome
After save, updated fields persist and non-edited existing hardware component data is retained.
