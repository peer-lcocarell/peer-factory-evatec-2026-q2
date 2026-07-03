# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System Type: Verify tester can upload a document during magnet system type creation (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290758
Requirement: View and upload documents for new magnet system type (New Magnet System Type)

## Preconditions
- User is signed in with permission to create Magnet System Types.
- A valid document file is available on the local machine.
- Magnet System Type creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the documents area on the New Magnet System Type screen. | Upload control is visible and enabled. |
| 2 | Select a valid document from local storage. | File is queued for upload. |
| 3 | Confirm the upload. | File uploads successfully without validation errors. |
| 4 | Save the new Magnet System Type. | Save succeeds and uploaded document is associated to the new record. |

## Expected Outcome
Tester can upload a document during Magnet System Type creation and it is stored with the created record.
