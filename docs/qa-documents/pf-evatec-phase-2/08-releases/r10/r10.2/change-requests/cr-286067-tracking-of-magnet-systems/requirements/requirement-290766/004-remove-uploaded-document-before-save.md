# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System: Remove an uploaded document before saving and verify no confirmation prompt is displayed

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
| 2 | Select a valid document from local storage and upload it. | The file is listed in the Documents section. |
| 3 | Select the remove action for the uploaded document. | No confirmation dialog, modal, or prompt is displayed. The document is removed from the Documents list immediately. |
| 4 | Verify the Documents list after removal. | The removed document is no longer displayed in the Documents section. |
| 5 | Save the new Magnet System. | Save completes without error. |
| 6 | Re-open the Magnet System record. | The removed document is not present in the Documents section. |

## Expected Outcome
Document removal requires no confirmation. The document is removed immediately upon selecting the remove action. After save, the removed document is not associated with the record.
