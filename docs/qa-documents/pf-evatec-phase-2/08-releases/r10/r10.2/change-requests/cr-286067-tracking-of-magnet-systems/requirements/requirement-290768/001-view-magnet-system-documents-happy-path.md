# R10.2 Update for CR 286067 - View Magnet System Documents: Verify uploaded Magnet System documents are accessible (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290768
Requirement: View magnet system documents (View Magnet System)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A target Magnet System exists with at least two attached documents.
- Baseline metadata is available for each attached document:
	- Filename
	- File type/extension
	- Expected content marker to confirm content identity after open and download
- The 'View Magnet System' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'View Magnet System' page for a record with attached documents. | The View screen loads and the Documents section is visible. |
| 2 | Review the Documents list and record each listed document name. | All expected documents are listed with filename and metadata. |
| 3 | Open the first listed document from the Documents section. | The selected document opens in the configured viewer. |
| 4 | Read the opened document content and compare to the expected content marker. | The opened document content matches the expected content marker for that file. |
| 5 | Repeat open and content comparison for each remaining listed document. | Each opened document matches the expected content marker for its file. |
| 6 | Download the first listed document from the Documents section. | The selected document is downloaded to the local machine. |
| 7 | Open the downloaded file and compare to the expected content marker. | The downloaded document content matches the expected content marker for that file. |
| 8 | Repeat download and content comparison for each remaining listed document. | Each downloaded document matches the expected content marker for its file. |

## Expected Outcome
Documents attached to a Magnet System are listed in the Documents section on the View page. Each listed document can be opened and downloaded. Opened and downloaded content for every listed file matches the expected baseline content.
