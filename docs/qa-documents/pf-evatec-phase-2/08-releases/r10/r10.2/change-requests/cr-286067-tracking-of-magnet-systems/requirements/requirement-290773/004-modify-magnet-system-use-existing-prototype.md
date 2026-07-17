# R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can use an existing Prototype Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System in `Checked Out` status exists and is linked to a Standard Magnet System Type.
- At least one Prototype Magnet System Type exists that originates from the same predecessor article number.
- At least one Prototype Magnet System Type exists that does NOT match the current Magnet System Type.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System with status `Checked Out` and trigger the 'Modify' action. | The Modify workflow opens. The option to use an existing Prototype is available alongside the option to create a new one. |
| 2 | Select the option to use an existing Prototype. Review the prototype list. | The prototype list is displayed. Prototypes that originate from the same predecessor article number are shown. |
| 3 | Select a Prototype Magnet System Type that matches the current type's predecessor. | The prototype is selected. The Continue (Next) button is available. |
| 4 | Select a Prototype Magnet System Type that does NOT match the current Magnet System Type and proceed. | A confirmation prompt is displayed asking the user to confirm the selection. The details shown are read-only. |
| 5 | Confirm the selection. | The Magnet System is updated to use the selected existing Prototype Magnet System Type. |
| 6 | Re-open the Magnet System record. | The Magnet System displays the selected Prototype Magnet System Type. |
| 7 | Review Magnet System Type records after save. | No new Prototype Magnet System Type is created during assignment to an existing prototype. |
| 8 | Open the Magnet System History view. | A history entry is present for the Modify event including the selected prototype variant, the current user, and the timestamp. The entry reflects type change from the original Standard type to the selected Prototype type. |

## Expected Outcome
The Modify workflow allows selection of an existing Prototype Magnet System Type. The prototype list is filterable by predecessor. When a differing prototype is selected, a read-only confirmation prompt is shown before proceeding. After confirmation, the Magnet System is updated to the selected prototype without creating a new variant and a history entry is written.
