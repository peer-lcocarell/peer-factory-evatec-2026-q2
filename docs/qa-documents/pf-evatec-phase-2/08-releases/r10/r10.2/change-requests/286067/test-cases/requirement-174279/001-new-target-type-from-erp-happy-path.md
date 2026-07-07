# R10.2 Update for CR 286067 - New Target Type from ERP: Verify target type imported from ERP is available for selection (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- ERP-imported Hardware Components with target-type mappings exist.
- The 'Targets' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Targets' page and start creating a new target. | The Select Target Type modal is displayed. |
| 2 | Choose the option to select a target type by ERP article. | The ERP article selector loads with available records. |
| 3 | Select a valid ERP-imported record. | Target type fields (Article Number, Name, ERP Status) populate from ERP data. |
| 4 | Continue and save the new target. | The target is created using the ERP-sourced target type. The record appears in the Targets list. |

## Expected Outcome
ERP-imported target types are available for selection in the ERP article selector. Selecting a valid record populates the target type fields with ERP data. The new target is created and visible in the 'Targets' list.
