# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System Type: Verify tester can upload a document during Magnet System Type creation (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290758
Requirement: View and upload documents for new magnet system type (New Magnet System Type)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A valid supported document file is available on the local machine.
- Magnet System Type creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Documents area on the 'New Magnet System Type' screen. | The upload control is visible and enabled. |
| 2 | Select a valid document from local storage. | The file is queued for upload and the filename is displayed. |
| 3 | Confirm the upload. | The file uploads. The document appears in the Documents list with its filename and metadata. |
| 4 | Save the new Magnet System Type. | Save completes. The uploaded document is associated with the new record. |
| 5 | Re-open the new Magnet System Type record. | The uploaded document is listed in the Documents section. |

## Expected Outcome
A document can be uploaded during Magnet System Type creation. The document is associated with the new record after save. The document is visible on the record after re-opening.
