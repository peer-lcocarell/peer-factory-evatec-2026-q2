# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify invalid file types are rejected on upload (Unhappy Path)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists.
- A file with an unsupported file type is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type documents section and start an upload. | File picker opens. |
| 2 | Select a file with an unsupported file type. | A validation error is displayed stating the file type is not allowed. The file is not added to the document list. |
| 3 | Select a file with a supported file type. | File is accepted and appears in the pending upload list. |

## Expected Outcome

Unsupported file types are rejected with clear validation feedback and are not added. Supported file types remain uploadable.
