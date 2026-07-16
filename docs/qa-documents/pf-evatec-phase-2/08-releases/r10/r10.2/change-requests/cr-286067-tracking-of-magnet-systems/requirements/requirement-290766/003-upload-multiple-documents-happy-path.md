# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System: Upload multiple documents and verify selective removal during Magnet System creation

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290766
Requirement: View and upload documents for new magnet system (New Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- Two or more valid supported document files are available on the local machine.
- Magnet System creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Documents area on the 'New Magnet System' screen. | The upload control is visible and enabled. |
| 2 | Select the first valid document from local storage and upload it. | The first file is queued and the filename is displayed in the Documents list. |
| 3 | Select a second valid document from local storage and upload it. | The second file is queued and both filenames are displayed in the Documents list. |
| 4 | Verify both documents are listed before saving. | Both document filenames are visible in the Documents section. |
| 5 | Select the remove action for the first document only. | The first document is removed immediately. No confirmation dialog is displayed. |
| 6 | Verify the Documents list after removal. | Only the second document remains. The first document is no longer listed. |
| 7 | Save the new Magnet System. | Save completes without error. |
| 8 | Re-open the Magnet System record. | Only the retained document is listed in the Documents section. The removed document is not present. |

## Expected Outcome
Multiple documents can be uploaded and are visible before save. Removing one document from a multi-document upload removes only the selected document without a confirmation prompt. Remaining documents are unaffected and remain associated with the record after save.
