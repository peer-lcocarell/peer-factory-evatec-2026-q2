# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify hardware configuration can be exported successfully (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A tool with a saved hardware configuration exists.
- The Export functionality is accessible on the 'Tool Hardware Configuration' page.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for a tool with configured hardware. | The hardware configuration is displayed for the tool. |
| 2 | Trigger the 'Export' action. | Export starts without validation errors. |
| 3 | Wait for the export file to be generated. | The file is produced and a download link or notification is displayed. |
| 4 | Confirm the exported file is downloadable. | The export file downloads and the downloaded file is non-empty. |

## Expected Outcome
The hardware configuration export completes for the selected tool. The exported file is non-empty and is available for download.
