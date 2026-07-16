# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can replace an existing Magnet System Type document (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents in Edit Magnet System Type

## Tags
- R10.2

## Preconditions
- User is signed in with MagnetSystemType_View and MagnetSystemType_Edit permissions.
- A Magnet System Type record exists with at least two documents already attached.
- A valid replacement document is available on the local machine.
- A valid new additional document is available on the local machine.
- The tester can access the Edit Magnet System Type page for the target record.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open Edit Magnet System Type for the target record. | The page loads and the Documents section shows the current attached document list. |
| 2 | Use the document upload control to add a new additional document. | The new document appears in the Documents list with the uploaded filename. |
| 3 | Open the newly added document from the Documents list. | The document opens successfully in the supported viewer or file handler. |
| 4 | Download the newly added document from the Documents list. | The file download completes successfully and the downloaded file name matches the selected document. |
| 5 | Select one existing document and choose Replace. | A file picker or replace upload control is shown for the selected document. |
| 6 | Upload the replacement document and confirm the replace action. | The selected document entry is updated with the new filename. The old filename is no longer shown in the list before save. |
| 7 | Select one document and choose Remove. | A confirmation dialog is displayed before deletion is applied. |
| 8 | In the confirmation dialog, choose Cancel or equivalent dismiss action. | The dialog closes and the selected document remains visible in the Documents list. |
| 9 | Select the same document and choose Remove again, then confirm. | The selected document is removed from the Documents list and at least one other document remains visible. |
| 10 | Save the Magnet System Type record. | Save completes successfully and no validation or system error is shown. |
| 11 | Re-open the same Magnet System Type record in Edit mode. | The newly added document is still present. The replacement filename is still present. The original replaced filename is not present. The removed document is absent and remaining documents are still present. |

## Expected Outcome
The tester can add, open, download, replace, and remove Magnet System Type documents in Edit mode. A canceled remove action does not change the Documents list. A confirmed remove action is persisted after save and after reopening the record. The original replaced document name is removed and remaining documents are unaffected.
