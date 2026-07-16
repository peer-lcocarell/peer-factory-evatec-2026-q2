# R10.2 Update for CR 286067 - Modify Magnet System: Verify variant code increments correctly when creating successive prototype versions (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System exists with status `Checked Out` and is linked to a Standard Magnet System Type.
- The 'Magnet Systems' page and 'Magnet System Types' page are accessible.
- Assumption A10 applies (see assumptions.md): variant codes increment sequentially starting at V01.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System with status `Checked Out` and trigger the 'Modify' action. | The Modify workflow opens. An option to create a new Prototype Magnet System Type is available. |
| 2 | Attempt to confirm the new prototype with the Article Number field empty. | Confirmation is blocked. A required-field validation message is displayed on the Article Number field. |
| 3 | Enter an Article Number that already exists as a Hardware Component and attempt to confirm. | Confirmation is blocked. A validation message indicates the Article Number must not exist as a Hardware Component. |
| 4 | Attempt to confirm with the Description field empty. | Confirmation is blocked. A required-field validation message is displayed on the Description field. |
| 5 | Enter a valid unique Article Number (not a Hardware Component) and a valid Description. Confirm. | The first Prototype Magnet System Type is created. The variant code assigned is `V01`. The Magnet System is linked to the new prototype type. A history entry is written for the modification. |
| 6 | Open the V01 Prototype Magnet System Type record. | The predecessor field references the original Standard Magnet System Type. |
| 7 | Trigger a second Modify action on the same Magnet System. Select to create a new Prototype variant. Enter a different unique Article Number and Description. Confirm. | A second Prototype Magnet System Type is created. The variant code is `V02`. The Magnet System is now linked to the V02 prototype type. A history entry is written. |
| 8 | Open the 'Magnet System Types' page and locate both prototype types. | Both V01 and V02 Prototype Magnet System Types are visible in the list with their respective variant codes displayed. |

## Expected Outcome
Article Number and Description are required fields. Article Number must not exist as a Hardware Component. Each new Prototype version receives the next sequential variant code (V01, V02, V03, and so on). Each prototype type maintains a predecessor relationship to its source type. Each Modify action generates a history entry on the Magnet System.
