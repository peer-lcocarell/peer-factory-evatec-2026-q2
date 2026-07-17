# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify invalid document operations are rejected (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290770
Requirement: View and manage magnet system documents (Edit Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists with at least one attached document.
- A Magnet System exists with no attached documents.
- An invalid document file is available for testing.
- The 'Edit Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Edit Magnet System' page for the target record. | The Documents section is displayed with existing documents listed. |
| 2 | Select the 'Upload' action and choose an invalid document file. | The file selection is accepted and validation is performed. |
| 3 | Confirm the upload. | The upload is rejected. A validation message is displayed. The invalid file is not added to the Documents list. |
| 4 | Select an existing document and trigger the 'Replace' action. Choose the same invalid document file. | The file selection is accepted and validation is performed. |
| 5 | Confirm the replacement. | The replacement is rejected. A validation message is displayed. The original document remains unchanged in the Documents list. |
| 6 | Review the Documents section. | No new document has been added. No existing document has been replaced. |
| 7 | Open the Magnet System with no attached documents and attempt to trigger a remove action. | Remove action is hidden or disabled when no document exists. |
| 8 | Re-open the Magnet System record if saving is permitted. | The original document list remains unchanged. No invalid document is present. |

## Expected Outcome
Invalid document upload and replacement operations are rejected. Appropriate validation feedback is displayed. Existing documents remain unchanged when validation fails. Remove action is unavailable when no document exists. No unintended document additions, replacements, or data changes are persisted.
