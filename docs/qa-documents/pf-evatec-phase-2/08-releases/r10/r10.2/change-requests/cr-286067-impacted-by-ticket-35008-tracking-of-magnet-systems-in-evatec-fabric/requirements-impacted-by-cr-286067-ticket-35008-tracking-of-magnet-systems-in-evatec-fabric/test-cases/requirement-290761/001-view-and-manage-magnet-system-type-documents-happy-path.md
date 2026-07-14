# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can replace an existing Magnet System Type document (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents (Edit Magnet System Type)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Magnet System Type exists with at least one attached document.
- A replacement document file is available on the local machine.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Edit Magnet System Type' screen for the target record. | The Documents section is displayed with existing documents listed. |
| 2 | Select an existing document and trigger the 'Replace' action. | The replace file selection control is displayed. |
| 3 | Upload the replacement document and confirm. | The document is replaced. The replacement filename is displayed in the Documents list. |
| 4 | Save the Magnet System Type. | Save completes without errors. |
| 5 | Re-open the Magnet System Type record. | The replacement document is listed. The original document is no longer listed under its previous filename. |

## Expected Outcome
An existing Magnet System Type document can be replaced in Edit mode. The replacement document is stored and visible after save. The original document is no longer present under its previous filename.
