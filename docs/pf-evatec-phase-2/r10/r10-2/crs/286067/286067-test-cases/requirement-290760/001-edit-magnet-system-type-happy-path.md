# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify tester can update magnet system type information (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with permission to edit Magnet System Types.
- At least one editable Magnet System Type exists.
- Magnet System Types list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing Magnet System Type in Edit mode. | Edit screen loads with current data. |
| 2 | Update editable user-entered fields (for example Description, Application). | Changes are accepted. |
| 3 | Save the changes. | Save succeeds without validation errors. |
| 4 | Re-open the record. | Updated values are persisted. |

## Expected Outcome
Tester can update a Magnet System Type's editable fields and changes are saved correctly.
