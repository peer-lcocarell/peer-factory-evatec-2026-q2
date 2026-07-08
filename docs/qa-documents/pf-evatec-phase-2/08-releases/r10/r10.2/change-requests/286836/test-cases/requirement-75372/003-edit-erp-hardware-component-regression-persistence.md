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
- Record includes a mix of fields that will be edited and fields that will remain unchanged.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an ERP hardware component and note current key field values. | Baseline values are recorded. |
| 2 | Change a limited set of editable fields (including one text value and optional `Deleted` state when applicable). | Changes are accepted and Save is enabled. |
| 3 | Save the record. | Save succeeds with no unexpected validation. |
| 4 | Re-open the same hardware component. | Updated fields show new values. |
| 5 | Verify unchanged fields. | Fields not edited retain original values. |
| 6 | Return to list view and inspect key columns. | List view remains consistent with persisted edited and unchanged values. |

## Expected Outcome
After save, edited ERP hardware component fields persist correctly and non-edited data remains unchanged without regression.
