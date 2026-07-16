# R10.2 Update for CR 286067 - New Magnet System: Attempt to create a Magnet System with a duplicate serial number (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystems_View` and `MagnetSystems_Create` permissions.
- At least one Magnet System already exists with a known serial number.
- A valid Magnet System Type exists for selection.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and note the serial number of an existing Magnet System. | The existing serial number is captured. |
| 2 | Select the 'New' action to create a new Magnet System. | The 'New Magnet System' creation screen loads. |
| 3 | Enter a serial number with an invalid character such as `MS*123`. Select a valid Magnet System Type and attempt to save. | Save is blocked. Validation indicates only alphanumeric, slash, or dash characters are allowed. |
| 4 | Enter an empty serial number, then a 51-character serial number, and attempt to save in each case. | Save is blocked in both cases. Validation indicates serial number length must be 1 to 50 characters. |
| 5 | Enter the same serial number as the existing Magnet System and attempt to save. | Save is blocked. A validation error indicates the serial number is already in use. |
| 6 | Change the serial number to a valid unique value of 1 to 50 allowed characters and save again. | Validation clears. The new Magnet System is created with status `In Stock`. |

## Expected Outcome
The system enforces serial number rules for character set, length, and uniqueness. Save is blocked for invalid serial formats and duplicates. A valid unique serial number allows creation.
