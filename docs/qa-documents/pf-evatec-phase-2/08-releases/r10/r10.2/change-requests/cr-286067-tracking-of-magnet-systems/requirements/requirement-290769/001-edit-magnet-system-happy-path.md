# R10.2 Update for CR 286067 - Edit Magnet System: Verify tester can update Magnet System attributes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290769
Requirement: Edit Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System in an editable state exists.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open an existing Magnet System in Edit mode. | The Edit screen loads with current data displayed. |
| 2 | Review visible fields on the Edit screen. | Fields expected from View Magnet System are visible and available according to edit rules. |
| 3 | Update an editable attribute (for example Comment or Last Inspection Date). | The field accepts the new value. |
| 4 | Save the changes. | Save completes without validation errors and the user is redirected to the View Magnet System page. |
| 5 | Re-open the record in Edit mode. | The updated field values are displayed. The Serial Number and Magnet System Number remain unchanged. |

## Expected Outcome
User-entered editable fields on a Magnet System can be updated and saved. After save, the user is redirected to the View Magnet System page. Updated values persist on re-open. Immutable fields (Serial Number, Magnet System Number) are not changed by the edit operation.
