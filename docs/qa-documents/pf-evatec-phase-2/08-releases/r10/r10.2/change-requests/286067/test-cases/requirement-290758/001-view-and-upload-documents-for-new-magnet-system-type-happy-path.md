# 286067 Magnet Systems - Upload Single Document During New Magnet System Type Creation

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
|------|----------|----------------|
| 1 | Open the Documents area on the New Magnet System Type screen. | The upload control is visible and enabled. |
| 2 | Select a valid document file from local storage. | The file is selected and the filename is displayed. |
| 3 | Upload the selected file. | The file uploads successfully and appears in the Documents list with filename and metadata. |
| 4 | Save the new Magnet System Type. | Save completes and the uploaded document is associated with the new record. |
| 5 | Re-open the saved Magnet System Type record. | The uploaded document is visible in the Documents section. |

## Expected Outcome

A tester can upload one valid document during new Magnet System Type creation, and the document persists after save and reopen.
