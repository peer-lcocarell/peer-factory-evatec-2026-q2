# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify read-only field constraints are enforced on a Prototype Magnet System Type (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- At least one Prototype Magnet System Type exists.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Prototype Magnet System Type in Edit mode. | The Edit screen loads. Fields specific to the Prototype are displayed. |
| 2 | Attempt to edit the Article Number field. | The Article Number field is read-only. No input control is active for this field. |
| 3 | Attempt to edit the ERP-sourced fields (Article Number, Name, ERP Status, Successor). | All ERP-sourced fields are read-only and cannot be modified. |
| 4 | Edit the Description field and save. | Save completes without errors. The Description field value is updated. ERP-sourced fields remain unchanged. |
| 5 | Re-open the Prototype Magnet System Type. | Updated Description persists. ERP-sourced field values are unchanged. |

## Expected Outcome
ERP-sourced fields (Article Number, Name, ERP Status, Successor) are read-only in Edit mode for Prototype Magnet System Types and cannot be modified. Editable user-entered fields (for example Description) can be saved. The constraint is enforced consistently on Prototype types.
