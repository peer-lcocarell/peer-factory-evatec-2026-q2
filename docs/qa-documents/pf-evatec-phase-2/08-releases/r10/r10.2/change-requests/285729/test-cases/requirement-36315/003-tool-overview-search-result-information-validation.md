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
| 1 | Note the known tool name, tool type, and ECL location for a tool with an installed hardware component. | Baseline tool data is captured. |
| 2 | Open 'Hardware Search' and search using criteria that match the installed hardware component. | The search returns at least one result for the known component. |
| 3 | Review the Tool column in the result row for the matching component. | The Tool name in the search result matches the known tool name from Step 1. |
| 4 | Review the Module column in the result row. | The Module location in the search result matches the known module location on that tool. |
| 5 | Navigate to the Tool Overview via the Tool link. | The 'Tool Overview' page loads and displays the same tool name, type, and ECL location captured in Step 1. |

## Expected Outcome
The Tool name and Module location displayed in Hardware Search results match the actual tool and module where the hardware is installed. Navigating to the Tool Overview confirms the tool identity. No mismatched or stale tool data is presented in the search results.
