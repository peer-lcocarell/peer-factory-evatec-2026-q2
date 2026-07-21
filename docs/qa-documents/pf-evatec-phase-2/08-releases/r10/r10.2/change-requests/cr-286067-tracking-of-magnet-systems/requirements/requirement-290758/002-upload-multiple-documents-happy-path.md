# R10.2 Update for CR 286067 - View and Upload Documents for New Magnet System Type: Upload Multiple Documents During New Magnet System Type Creation

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290758
Requirement: View and upload documents for new magnet system type (New Magnet System Type)

## Preconditions

- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.

- Two or more valid supported document files are available on the local machine.

- Magnet System Type creation is in progress with required data entered.

| Step | Action | Expected Result |
|------|--------|------------------|
| 1 | Open the Documents area on the New Magnet System Type screen. | The upload control is visible and enabled. |
| 2 | Upload the first valid document file. | The first file uploads successfully and appears in the Documents list. |
| 3 | Upload the second valid document file. | The second file uploads successfully and appears in the Documents list. |
| 4 | Verify the Documents list before save. | All uploaded files are listed with correct filenames. |
| 5 | Save the new Magnet System Type. | Save completes successfully and all uploaded files are associated with the record. |
| 6 | Re-open the saved Magnet System Type record. | All uploaded files remain visible in the Documents section. |

## Expected Outcome

A tester can upload one or more valid documents during creation, and all uploaded files persist after save and reopen.
