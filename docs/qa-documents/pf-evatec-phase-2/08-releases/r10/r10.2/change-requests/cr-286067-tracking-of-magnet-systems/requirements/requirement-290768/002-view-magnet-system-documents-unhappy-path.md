# R10.2 Update for CR 286067 - View Magnet System Documents: Verify document access when listed as unavailable to open or download (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290768
Requirement: View magnet system documents (View Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A Magnet System exists with an attached document that is listed but unavailable to open or download.
- The 'View Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'View Magnet System' page for the affected Magnet System record. | The View screen loads and the Documents section is visible. |
| 2 | Confirm the unavailable document is listed in the Documents section. | The document entry is visible with filename and metadata. |
| 3 | Attempt to open the unavailable document. | The system does not crash and shows a clear error that the document cannot be opened. |
| 4 | Attempt to download the same unavailable document. | The system does not crash and shows a clear error that the document cannot be downloaded. |
| 5 | Refresh the page and repeat open and download for another available document in the same list. | The available document can still be opened and downloaded successfully. |

## Expected Outcome
When a listed document is unavailable, open and download attempts fail gracefully with a clear user-facing error. The page remains stable, and access to other available documents continues to work.
