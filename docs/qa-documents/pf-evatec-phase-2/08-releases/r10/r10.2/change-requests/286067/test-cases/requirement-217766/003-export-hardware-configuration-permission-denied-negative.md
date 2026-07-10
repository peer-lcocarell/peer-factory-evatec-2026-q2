# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify export from rewind configuration includes rewind-specific values

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A tool exists with historical hardware configuration snapshots that can be opened in rewind mode.
- Rewind-selected date and current/latest date values are known for comparison.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' rewind view for the target tool and select a historical configuration date. | Historical configuration values for the selected rewind date are displayed. |
| 2 | Trigger Export from rewind view. | Export completes successfully and file is available for download. |
| 3 | Open the exported file and inspect date/timestamp fields. | Rewind-related selected date and required timestamp fields are present and correspond to the rewind context. |
| 4 | Compare rewind export values against latest export for the same tool. | Fields that differ between rewind and latest states (for example Article # or role value changes) reflect the rewind-selected configuration correctly. |

## Expected Outcome
Hardware configuration can be exported from rewind view. The export contains rewind-specific date/timestamp context and data values that match the selected historical configuration.
