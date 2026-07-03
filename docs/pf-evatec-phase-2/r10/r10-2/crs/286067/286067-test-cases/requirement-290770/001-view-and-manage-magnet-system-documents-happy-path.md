# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify tester can delete a magnet system document (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290770
Requirement: View and manage magnet system documents (Edit Magnet System)

## Preconditions
- User is signed in with permission to edit Magnet Systems.
- A Magnet System exists with at least one deletable document.
- Edit Magnet System page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Edit Magnet System for the target record. | Documents section is displayed. |
| 2 | Select an existing document and choose Delete. | Confirmation prompt is displayed. |
| 3 | Confirm the deletion. | Document is removed successfully. |
| 4 | Save changes and re-open the record. | Deleted document no longer appears in documents list. |

## Expected Outcome
Tester can delete a Magnet System document and the removal persists.
