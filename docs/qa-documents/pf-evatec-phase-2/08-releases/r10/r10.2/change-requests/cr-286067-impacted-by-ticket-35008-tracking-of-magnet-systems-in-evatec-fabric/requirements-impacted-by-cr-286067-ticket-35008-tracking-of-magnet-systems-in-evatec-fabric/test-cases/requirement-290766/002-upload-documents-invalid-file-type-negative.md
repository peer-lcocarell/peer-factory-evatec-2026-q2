# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System: Attempt to upload an invalid file type during Magnet System creation (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290766
Requirement: View and upload documents for new magnet system (New Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- An unsupported file type is available on the local machine.
- Magnet System creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Documents area on the 'New Magnet System' screen. | The upload control is displayed. |
| 2 | Attempt to select and upload an unsupported file type. | The upload is rejected. A validation message is displayed identifying the file type as unsupported. |
| 3 | Select a valid supported document file and upload. | The valid file uploads without error and is listed in the Documents section. |

## Expected Outcome
Unsupported file types are rejected during document upload on the New Magnet System screen. A clear error message identifies the invalid file type. Valid document formats upload without error.
