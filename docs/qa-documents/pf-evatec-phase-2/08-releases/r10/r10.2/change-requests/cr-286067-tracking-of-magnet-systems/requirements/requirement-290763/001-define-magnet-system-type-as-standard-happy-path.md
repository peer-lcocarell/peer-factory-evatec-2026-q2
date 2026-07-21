# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify tester can set a Magnet System Type as the standard type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, `MagnetSystem_View`, and `MagnetSystems_Modify` permissions.
- A Prototype Magnet System Type exists with a predecessor reference and variant code (for example `V01`).
- At least one Magnet System is assigned to the Prototype Magnet System Type.
- The 'Define as Standard' action is accessible from the 'Magnet System Types' area.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list and select the Prototype Magnet System Type. | The record is displayed as Prototype and the 'Define as Standard' action is available. |
| 2 | Trigger the 'Define as Standard' action. | An ERP article selection prompt is displayed. |
| 3 | Select an article number from ERP and confirm. | The dialog closes and the Magnet System Type record is displayed with the selected ERP article number applied. |
| 4 | Open the updated Magnet System Type record. | The type is now Standard. The predecessor is removed and the variant code is cleared. |
| 5 | Open the Magnet System Type History view and locate the define as standard entry. | A history entry is present with timestamp, user, and summary text in the format Defined as standard with article # [value] and [count] magnet systems. |
| 6 | Open the details of that history entry. | The details include the list of all Magnet Systems that were assigned to the type at the time the define as standard action was performed. |

## Expected Outcome
The selected Prototype Magnet System Type is redefined as Standard after confirmation. The article number is updated from ERP, predecessor is removed, and variant code is cleared. A correctly formatted type history entry is recorded with timestamp, user, article number, and assigned magnet systems count, and the details list all assigned Magnet Systems.
