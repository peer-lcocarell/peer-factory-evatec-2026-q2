# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify export availability from latest configuration and pending-change restriction

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
| 2 | Verify the page is showing latest saved configuration with no pending changes. | Export action is available and enabled. |
| 3 | Trigger the 'Export' action. | Export starts without validation errors. |
| 4 | Wait for the export file to be generated and download it. | A file is produced, downloadable, and non-empty. |
| 5 | Return to the same configuration and create an unsaved change. | The page enters pending-change state. |
| 6 | Review Export action availability in pending-change state. | Export is unavailable, disabled, or blocked while pending changes exist. |

## Expected Outcome
Hardware configuration export is available from latest saved state without pending changes and is blocked in pending-change state. Generated export files are downloadable and non-empty when export is allowed.
