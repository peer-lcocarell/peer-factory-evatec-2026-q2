# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can remove a document from a Magnet System Type in Edit mode (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents (Edit Magnet System Type)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Magnet System Type exists with at least two attached documents.
- The 'Edit Magnet System Type' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Edit Magnet System Type' screen for the target record. | The edit page loads. The Documents section is visible and lists the attached documents. |
| 2 | Select a document from the list and trigger the 'Remove' action. | A removal confirmation dialog or prompt is displayed. |
| 3 | Confirm the removal. | The document is removed from the Documents list. At least one remaining document is still visible. |
| 4 | Save the Magnet System Type. | Save completes without errors. |
| 5 | Re-open the Magnet System Type record. | The removed document is no longer listed. The remaining documents are still present. |

## Expected Outcome
A document can be removed from a Magnet System Type in Edit mode. The removal persists after save. Remaining documents are unaffected by the removal.
