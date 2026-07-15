# R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can submit a modification request for a Magnet System (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System in `In Stock` status exists.
- At least one Prototype Magnet System Type is available, or the tester can create a new prototype variant.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Magnet System with status `In Stock` and trigger the 'Modify' action. | The Modify workflow is displayed with options to use an existing Prototype or create a new Prototype variant. |
| 2 | Select to create a new Prototype variant and enter a unique Article Number. Confirm. | The new Prototype Magnet System Type is created with variant code `V01`. The Magnet System is linked to the new Prototype type. |
| 3 | Re-open the Magnet System record. | The Magnet System displays the new Prototype Magnet System Type with variant code `V01`. |
| 4 | Open the Magnet System History view. | A history entry is present for the Modify event recording the type change, the new Prototype Article Number, and the current user and timestamp. |

## Expected Outcome
The Modify action converts the Magnet System to use a new Prototype Magnet System Type. The Magnet System record reflects the updated type after modification. A history entry records the modification event with the prototype type details.
