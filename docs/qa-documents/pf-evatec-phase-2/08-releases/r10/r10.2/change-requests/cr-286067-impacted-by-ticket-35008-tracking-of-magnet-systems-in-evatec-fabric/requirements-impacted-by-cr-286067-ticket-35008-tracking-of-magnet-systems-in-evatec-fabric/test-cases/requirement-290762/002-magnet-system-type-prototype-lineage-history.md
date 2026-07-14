# R10.2 Update for CR 286067 - Magnet System Type History: Verify history records prototype lineage from Standard through Prototype creation and promotion (Audit)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290762
Requirement: Magnet System Type History (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Standard Magnet System Type exists.
- The Magnet System Type History view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Standard Magnet System Type and navigate to its History view. | The History view loads. A creation history entry is present. |
| 2 | Create a Prototype from the Standard type with a unique Article Number. | The Prototype Magnet System Type is created with variant code `V01`. |
| 3 | Open the Prototype Magnet System Type History view. | A creation history entry is present for the Prototype. The entry references the source Standard type. The current user and timestamp are recorded. |
| 4 | Edit the Prototype Magnet System Type (for example update Description) and save. | Save completes. |
| 5 | Review the Prototype History view. | A new history entry is present for the edit event with the current user and timestamp. |
| 6 | Promote the Prototype to Standard using the 'Define as Standard' action. | Promotion completes. |
| 7 | Open the History view for the (now Standard) Magnet System Type. | A promotion history entry is present. The full history trail from Create Standard -> Create Prototype V01 -> Edit -> Promote to Standard is visible in chronological order. |

## Expected Outcome
The Magnet System Type History view shows the complete lineage of a type across all lifecycle events: initial creation, prototype creation (with source type reference), edits, and promotion to Standard. Each entry includes the user and timestamp. The history of a promoted type is not truncated.
