# R10.2 Update for CR 286067 - Modify Magnet System: Verify variant code increments correctly when creating successive prototype versions (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System exists with status `In Stock` and is linked to a Standard Magnet System Type.
- The 'Magnet Systems' page and 'Magnet System Types' page are accessible.
- Assumption A10 applies (see assumptions.md): variant codes increment sequentially starting at V01.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System and trigger the 'Modify' action to create a new Prototype variant. | The Modify workflow opens. An option to create a new Prototype Magnet System Type is available. |
| 2 | Select to create a new prototype variant and enter a unique Article Number (dummy number that does not match any Hardware Component). Confirm. | The first Prototype Magnet System Type is created. The variant code assigned is `V01`. The Magnet System is linked to the new prototype type. A history entry is written for the modification. |
| 3 | Trigger a second Modify action on the same Magnet System to create another Prototype variant from the V01 type. | The Modify workflow opens. |
| 4 | Create a second new prototype and enter a different unique Article Number. Confirm. | A second Prototype Magnet System Type is created. The variant code is `V02`. The Magnet System is now linked to the V02 prototype type. A history entry is written. |
| 5 | Open the 'Magnet System Types' page and locate both prototype types. | Both V01 and V02 Prototype Magnet System Types are visible in the list with their respective variant codes displayed. |

## Expected Outcome
Each new Prototype version created via Modify receives the next sequential variant code (V01, V02, V03, and so on). Variant codes are visible on the Magnet System Type record. Each Modify action generates a history entry on the Magnet System recording the type change and variant code.
