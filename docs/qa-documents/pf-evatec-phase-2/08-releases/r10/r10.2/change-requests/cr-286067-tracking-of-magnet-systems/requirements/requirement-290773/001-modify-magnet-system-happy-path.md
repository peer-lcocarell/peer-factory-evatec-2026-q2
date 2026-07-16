# R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can submit a modification request for a Magnet System (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System in `Checked Out` status exists and is linked to a Standard Magnet System Type.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Magnet System with status `Checked Out` and trigger the 'Modify' action. | The Modify workflow is displayed with options to use an existing Prototype or create a new Prototype variant. |
| 2 | Select to create a new Prototype variant. Enter a unique Article Number (must not exist as a Hardware Component) and a Description. Confirm. | The new Prototype Magnet System Type is created with variant code `V01`. The Magnet System is linked to the new Prototype type. |
| 3 | Re-open the Magnet System record. | The Magnet System displays the new Prototype Magnet System Type with variant code `V01`. The status is unchanged. |
| 4 | Review the Last Inspection Date on the Magnet System record. | The Last Inspection Date is updated to the current date. |
| 5 | Open the Magnet System Type record for the new prototype. | The predecessor field references the original Standard Magnet System Type. A Magnet System Type history entry is present for the creation of the prototype. |
| 6 | Open the Magnet System History view. | A history entry is present for the Modify event in the format `magnet system prototype V01`. The entry includes the current user and timestamp. |

## Expected Outcome
The Modify action converts the Magnet System to use a new Prototype Magnet System Type with variant code `V01`. The Last Inspection Date is updated to the current date. The new Magnet System Type records the predecessor relationship and a type history entry. A prototype history entry is written to the Magnet System history including the variant number, user, and timestamp.
