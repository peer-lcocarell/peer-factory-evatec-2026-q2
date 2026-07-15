# R10.2 Update for CR 285729 - Tool Overview: Verify Hardware Search results navigate to the correct Tool Overview page (Happy Path)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 36315
Requirement: Tool Overview (Tool Overview)

## Preconditions
- User is signed in with `ToolOverview_View` and `HardwareConfiguration_View` permissions.
- At least one hardware component is currently installed on a known tool.
- The 'Hardware Search' feature is accessible from the 'Tool Overview' page.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Tool Overview' page and select a tool with a logbook configured. | The 'Hardware' and 'Search Hardware' buttons are visible. |
| 2 | Open 'Search Hardware' and search for a known installed hardware component. | At least one result is returned with Tool and Module columns populated. |
| 3 | Select the Tool link for the matching result. | The 'Tool Overview' page opens for that exact tool. |
| 4 | Verify the tool identity and installed component. | Tool name matches the result, and the component appears in current hardware configuration. |

## Expected Outcome
The tester can open 'Search Hardware' from 'Tool Overview', find a known component, and navigate to the correct tool using the Tool link.
