# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System: Verify tester can upload documents while creating a magnet system (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290766
Requirement: View and upload documents for new magnet system (New Magnet System)

## Preconditions
- User is signed in with permission to create Magnet Systems.
- A valid document is available on the local machine.
- Magnet System creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the documents area on the New Magnet System screen. | Upload control is visible and enabled. |
| 2 | Select a valid document from local storage. | File is queued for upload. |
| 3 | Confirm the upload. | Upload completes successfully. |
| 4 | Save the new Magnet System. | Save succeeds and uploaded document is associated to the new record. |

## Expected Outcome
Tester can upload one or more documents while creating a Magnet System and they persist with the record.
