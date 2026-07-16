# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify tester can upload, replace, and access documents on a Magnet System in Edit mode

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290770
Requirement: View and manage magnet system documents (Edit Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists with at least one attached document.
- A replacement document file is available on the local machine.
- A new document file is available on the local machine.
- The 'Edit Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Edit Magnet System' page for the target record. | The Documents section is displayed with existing documents listed. |
| 2 | Open or download an existing document. | The selected document opens or downloads successfully. |
| 3 | Select the 'Upload' action and choose a new document from local storage. | The file is queued for upload. |
| 4 | Confirm the upload. | The new document is added to the Documents list. |
| 5 | Select the original existing document and trigger the 'Replace' action. Upload a replacement file. | The replacement file is queued. |
| 6 | Confirm the replacement. | The original document is replaced by the new file. The document name or identifier updates in the list. |
| 7 | Save the Magnet System. | Save completes without errors. |
| 8 | Re-open the Magnet System record. | The newly uploaded document and the replacement document are present. The originally replaced document is no longer listed under its old filename. |
| 9 | Open or download the newly uploaded document. | The document opens or downloads successfully. |
| 10 | Open or download the replacement document. | The replacement document opens or downloads successfully. |

## Expected Outcome
Documents can be uploaded and replaced on an existing Magnet System in Edit mode. Existing documents can be opened or downloaded. Uploaded documents are added to the existing list. Replaced documents are substituted without removing other documents. Uploaded and replacement documents remain accessible after save. All changes persist after save and re-open.
