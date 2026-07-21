# R10.2 Update for CR 286067 - View Magnet System Documents: Verify multiple document access failures are handled without blocking other document actions (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290768
Requirement: View magnet system documents (View Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A target Magnet System exists with at least three attached documents:
  - Document A is listed but unavailable to open.
  - Document B is listed but unavailable to download.
  - Document C is available for both open and download.
- The 'View Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'View Magnet System' page for the target record. | The View screen loads and the Documents section is visible. |
| 2 | Locate Document A and attempt to open it. | An error message is displayed indicating the document cannot be opened. The page remains responsive. |
| 3 | Without leaving the page, locate Document B and attempt to download it. | An error message is displayed indicating the document cannot be downloaded. The page remains responsive. |
| 4 | Retry open on Document A and retry download on Document B. | The same error behavior is shown consistently on retry and no duplicate or stacked error state blocks further actions. |
| 5 | Locate Document C and open it. | Document C opens in the configured viewer. |
| 6 | Download Document C. | Document C downloads to the local machine. |
| 7 | Refresh the page and review the Documents section again. | The Documents list is still visible and all entries remain listed. Failed operations did not remove or corrupt listed document entries. |

## Expected Outcome
When multiple document access failures occur on the same record, the system shows clear user-facing errors and keeps the page stable. Failed open and download attempts remain isolated to unavailable documents, and available documents can still be opened and downloaded.
