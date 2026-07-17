# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can remove a document from a Magnet System Type in edit mode (Happy Path)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents

## Metadata

- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists with at least one document attached.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and navigate to the documents section. | Attached document is listed. |
| 2 | Start the remove action for the document and confirm. | Document is removed. Document list no longer shows the removed file. |
| 3 | Reload the detail page. | Removed document does not reappear. Document list reflects the removal. |

## Expected Outcome

A user with edit permission can remove an attached magnet system type document after confirmation. The removed file no longer appears after page reload.
