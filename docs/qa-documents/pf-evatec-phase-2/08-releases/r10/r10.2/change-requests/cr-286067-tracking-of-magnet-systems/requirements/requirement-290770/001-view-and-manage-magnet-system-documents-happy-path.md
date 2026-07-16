# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify tester can delete a Magnet System document and validate confirmation behavior (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290770
Requirement: View and manage magnet system documents (Edit Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists with at least one deletable document.
- The 'Edit Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Edit Magnet System' page for the target record. | The Documents section is displayed with the existing documents listed. |
| 2 | Select an existing document and trigger the 'Delete' action. | A deletion confirmation dialog is displayed. |
| 3 | Select Cancel on the confirmation dialog. | The dialog closes. The document remains in the Documents list. |
| 4 | Select Delete for the same document again. | A deletion confirmation dialog is displayed. |
| 5 | Confirm the deletion. | The document is removed from the Documents list. |
| 6 | Save the Magnet System. | Save completes. |
| 7 | Re-open the record. | The deleted document is no longer listed in the Documents section. |

## Expected Outcome
A document can be deleted from a Magnet System in Edit mode. The deletion confirmation dialog supports both Cancel and Confirm actions. Selecting Cancel does not remove the document. Selecting Confirm removes the document and the deletion persists after save. The deleted document is absent from the Documents section on re-open.
