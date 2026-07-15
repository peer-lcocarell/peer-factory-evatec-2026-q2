# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System: Verify tester can upload documents while creating a Magnet System (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290766
Requirement: View and upload documents for new magnet system (New Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A valid supported document file is available on the local machine.
- Magnet System creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Documents area on the 'New Magnet System' screen. | The upload control is visible and enabled. |
| 2 | Select a valid document from local storage. | The file is queued for upload and the filename is displayed. |
| 3 | Confirm the upload. | The file uploads. The document appears in the Documents list with its filename. |
| 4 | Save the new Magnet System. | Save completes. The uploaded document is associated with the new record. |
| 5 | Re-open the Magnet System record. | The uploaded document is listed in the Documents section. |

## Expected Outcome
One or more documents can be uploaded during Magnet System creation. Documents are associated with the new record after save. All uploaded documents are visible on the record after re-opening.
