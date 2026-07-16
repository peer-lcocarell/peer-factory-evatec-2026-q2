# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify redefine as standard is limited to Prototype types and results in one Standard designation (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, and `MagnetSystems_Modify` permissions.
- One Magnet System Type is currently marked as Standard.
- At least one Prototype Magnet System Type exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list and select a record that is already Standard. | The redefine action is not available for execution or the system blocks execution because only Prototype types can be redefined as Standard. |
| 2 | Select a Prototype Magnet System Type and trigger 'Define as Standard'. Confirm the action. | The action completes successfully for the Prototype record. |
| 3 | Refresh the 'Magnet System Types' list. | The selected Prototype is now Standard and the previously Standard record is no longer marked as Standard. |
| 4 | Count records marked as Standard in the list. | Exactly one Magnet System Type is marked as Standard after the update. |

## Expected Outcome
Only Prototype Magnet System Types can be redefined as Standard. After a valid redefine operation, exactly one record is marked as Standard and any previous Standard designation is cleared.
