# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester cannot upload unsupported or oversized document files in Edit mode (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents in Edit Magnet System Type

## Tags
- R10.2

## Preconditions
- User is signed in with MagnetSystemType_View and MagnetSystemType_Edit permissions.
- A Magnet System Type record exists and can be opened in Edit mode.
- One unsupported file type is available on the local machine.
- One file larger than the configured upload size limit is available on the local machine.
- The tester can access the Edit Magnet System Type page for the target record.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open Edit Magnet System Type for the target record. | The page loads and the Documents section is visible. |
| 2 | Attempt to upload a file with an unsupported file type. | Upload is rejected and a validation message is shown. The file is not added to the Documents list. |
| 3 | Attempt to upload a file larger than the allowed upload size. | Upload is rejected and a size-related validation message is shown. The file is not added to the Documents list. |
| 4 | Save the Magnet System Type record. | Save completes successfully and no invalid document is stored. |
| 5 | Re-open the same Magnet System Type record in Edit mode. | The unsupported and oversized files are not present in the Documents list. |

## Expected Outcome
The tester cannot upload unsupported or oversized documents in Edit mode. Invalid uploads are blocked with validation feedback and are not persisted.
