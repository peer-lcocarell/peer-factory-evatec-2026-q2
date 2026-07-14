# R10.2 Update for CR 286067 - New Magnet System: Attempt to create a Magnet System with a duplicate serial number (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System already exists with a known serial number.
- A valid Magnet System Type exists for selection.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and note the serial number of an existing Magnet System. | The existing serial number is captured. |
| 2 | Select the 'New' action to create a new Magnet System. | The 'New Magnet System' creation screen loads. |
| 3 | Enter the same serial number as the existing Magnet System. Select a valid Magnet System Type. Attempt to save. | Save is blocked. A validation error is displayed indicating the serial number is already in use. |
| 4 | Change the serial number to a unique value and save again. | Validation clears. The new Magnet System is created with status `In Stock`. |

## Expected Outcome
The system prevents creating a Magnet System with a serial number that already exists. A clear validation error is displayed identifying the serial number conflict. A unique serial number allows the record to be created.
