# 286067 Magnet Systems - Combined Negative Validation for Document Upload and Removal During Creation

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290758
Requirement: View and upload documents for new magnet system type (New Magnet System Type)

## Preconditions

- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.

- One unsupported file type and two valid supported document files are available on the local machine.

- Magnet System Type creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Documents area on the New Magnet System Type screen. | 
The upload control is visible and enabled. |
| 2 | Attempt to upload an unsupported file type. |
 Upload is rejected, a validation message is shown, and the unsupported file is not listed. |
| 3 | Upload two valid supported document files. | 
Both valid files upload successfully and appear in the Documents list. |
| 4 | Remove one uploaded document using the remove action. | 
The selected document is removed immediately and no confirmation dialog is displayed. |
| 5 | Save the new Magnet System Type. | 
Save completes successfully with the current document list state. |
| 6 | Re-open the saved Magnet System Type record. | The removed document is not listed, the remaining valid document is listed, and the unsupported file was never persisted. |

## Expected Outcome

Unsupported file types are blocked with clear validation, document removal occurs without confirmation, and only valid non-removed documents persist after save and reopen.
