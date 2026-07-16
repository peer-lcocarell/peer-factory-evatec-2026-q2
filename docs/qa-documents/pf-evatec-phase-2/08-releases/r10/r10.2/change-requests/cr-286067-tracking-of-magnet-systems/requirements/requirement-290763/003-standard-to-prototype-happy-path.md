# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify ERP article selection and default dummy article behavior (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, and `MagnetSystems_Modify` permissions.
- A Prototype Magnet System Type exists with a current dummy article number.
- The dummy article number exists in ERP.
- At least one additional ERP article number is available for selection.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select the Prototype Magnet System Type. | The record is displayed and the 'Define as Standard' action is available. |
| 2 | Trigger the 'Define as Standard' action. | ERP article selection is shown and the current dummy article number is preselected by default. |
| 3 | Change the ERP selection to a different valid ERP article number and confirm. | Redefine as Standard completes and the type article number is updated to the selected ERP value. |
| 4 | Reopen the Magnet System Type record and review summary fields. | The persisted article number matches the selected ERP article value and remains stable after refresh. |
| 5 | Open Magnet System Type history for the redefine event. | The history summary includes the selected article number value and event metadata with timestamp and user. |

## Expected Outcome
During redefine as standard, the user is prompted to select an article number from ERP. If the current dummy article exists in ERP it is preselected by default. On confirmation the selected ERP article number is stored on the type and reflected in history.
