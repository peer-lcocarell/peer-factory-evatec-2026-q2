# R10.2 Update for CR 286067 - View Magnet System Documents: Verify uploaded Magnet System documents are accessible (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290768
Requirement: View magnet system documents (View Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A Magnet System exists with at least two attached documents.
- The 'View Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'View Magnet System' page for a record with attached documents. | The View screen loads and the Documents section is visible. |
| 2 | Review the documents list and note all listed documents. | Each uploaded document is listed with filename and metadata. |
| 3 | Open each listed document one by one from the Documents section. | Each selected document opens successfully in the appropriate viewer. |
| 4 | Verify content for each opened document. | Each opened document matches its originally uploaded file content. |
| 5 | Download each listed document one by one from the Documents section. | Each selected document downloads successfully to the local machine. |
| 6 | Verify content for each downloaded document. | Each downloaded document matches its originally uploaded file content. |

## Expected Outcome
Documents attached to a Magnet System are listed in the Documents section on the View page. Every listed document can be opened and downloaded successfully. For each document, the opened and downloaded content matches the originally uploaded file.
