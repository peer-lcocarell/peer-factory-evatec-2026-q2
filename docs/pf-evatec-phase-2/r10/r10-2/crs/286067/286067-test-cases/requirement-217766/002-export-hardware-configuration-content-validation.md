# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify exported file contains expected hardware configuration data (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with permissions to view and export Tool Hardware Configuration.
- A tool with a known hardware configuration (including magnet system role if applicable) is available.
- Approved reference data for comparison is available.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Tool Hardware Configuration for the target tool. | Configuration loads successfully. |
| 2 | Export the hardware configuration. | Export completes successfully. |
| 3 | Open the exported file and inspect fields. | File contains expected columns and sections. |
| 4 | Cross-check exported values against tool configuration in UI. | Values match the on-screen hardware configuration. |

## Expected Outcome
Exported hardware configuration file accurately reflects the tool's hardware configuration data.
