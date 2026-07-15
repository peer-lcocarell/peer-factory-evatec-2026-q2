# R10.2 Update for CR 285729 - Tool Overview: Verify correct tool information is displayed for returned hardware search results (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 36315
Requirement: Tool Overview (Tool Overview)

## Preconditions
- User is signed in with `ToolOverview_View` and `HardwareConfiguration_View` permissions.
- At least one hardware component is installed on a known tool with known identifying data (tool name, type, ECL location, equipment number).
- The 'Hardware Search' feature is accessible from the 'Tool Overview' page.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Record baseline tool values (tool name, tool type, ECL location) for a known installed component. | Baseline values are captured for comparison. |
| 2 | Run 'Hardware Search' with criteria matching that component. | A matching row is returned. |
| 3 | Verify Tool and Module values in the matching row. | Tool name and module location match known installation data. |
| 4 | Open 'Tool Overview' using the Tool link in that row. | The page shows the same tool name, type, and ECL location as baseline. |

## Expected Outcome
Tool and module values returned by Hardware Search match known installation data, and Tool link navigation opens the correct tool identity.
