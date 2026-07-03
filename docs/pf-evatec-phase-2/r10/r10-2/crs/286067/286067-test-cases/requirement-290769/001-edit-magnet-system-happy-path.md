# R10.2 Update for CR 286067 - Edit Magnet System: Verify tester can update magnet system attributes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290769
Requirement: Edit Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to edit Magnet Systems.
- At least one editable Magnet System exists.
- Magnet Systems list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing Magnet System in Edit mode. | Edit screen loads with current data. |
| 2 | Update editable attributes (for example Comment, Last Inspection Date). | Fields accept valid input. |
| 3 | Save the changes. | Save succeeds without validation errors. |
| 4 | Re-open the record. | Updated values are persisted correctly. |

## Expected Outcome
Tester can update editable Magnet System attributes and changes are saved accurately.
