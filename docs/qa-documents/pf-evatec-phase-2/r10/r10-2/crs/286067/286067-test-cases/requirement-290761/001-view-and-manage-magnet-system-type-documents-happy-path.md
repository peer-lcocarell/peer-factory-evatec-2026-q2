# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can replace an existing magnet system type document (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents (Edit Magnet System Type)

## Preconditions
- User is signed in with permission to edit Magnet System Types.
- A Magnet System Type exists with at least one attached document.
- A replacement document file is available.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Edit Magnet System Type screen for the target record. | Documents section is displayed. |
| 2 | Select an existing document and choose the Replace action. | Replace control is displayed. |
| 3 | Upload the replacement document and confirm. | Document is replaced successfully. |
| 4 | Save changes and re-open the record. | Replaced document is displayed as the current attachment. |

## Expected Outcome
Tester can replace an existing document on a Magnet System Type and the new document is stored.
