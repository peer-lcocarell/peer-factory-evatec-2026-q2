# R10.2 Update for CR 286067 - New Magnet System: Verify tester can create a new Magnet System using a valid Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one valid Magnet System Type exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select 'New'. | The 'New Magnet System' creation screen loads. |
| 2 | Enter a unique Serial Number and a Last Inspection Date. | The required fields accept valid input. |
| 3 | Select a valid Magnet System Type from the available list. | The Magnet System Type is selected. Related read-only fields populate from the type. |
| 4 | Save the new Magnet System. | Save completes. The new record appears in the 'Magnet Systems' list with status `In Stock`. |
| 5 | Open the new Magnet System record. | The record displays the correct Serial Number, Magnet System Type, and `In Stock` status. |

## Expected Outcome
A new Magnet System is created with a unique serial number and a valid Magnet System Type. After save, the record appears in the list with status `In Stock`. The Serial Number and Magnet System Type are displayed correctly on the record.
