# R10.2 Update for CR 286067 - New Target Type from ERP: Verify target type imported from ERP is available for selection (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- ERP-imported hardware components with target-type mappings exist.
- Targets page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Targets and start creating a new target. | Select Target Type modal is displayed. |
| 2 | Choose the option to select a target type by ERP article. | ERP article selector loads available records. |
| 3 | Select a valid ERP-imported record. | Target type fields populate from ERP data. |
| 4 | Continue and save the new target. | Target is created using the ERP-sourced target type. |

## Expected Outcome
ERP-imported target types are available for selection and can be used to create new targets successfully.
