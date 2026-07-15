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
| 1 | Open the 'Tool Overview' page and select a tool that has a logbook configured. | The 'Hardware' and 'Search Hardware' buttons are visible in the toolbar. |
| 2 | Click the 'Search Hardware' button and enter criteria matching a known installed hardware component. | The Hardware Search dialog opens. Matching results are displayed showing Tool name and Module location. |
| 3 | Click the Tool navigation link in a matching result. | The user is navigated to the 'Tool Overview' page for the identified tool. |
| 4 | Verify Tool Overview contents. | The Tool Overview displays the expected tool. The installed hardware component is reflected in the current hardware configuration. |

## Expected Outcome
The 'Search Hardware' button on the 'Tool Overview' page opens the Hardware Search dialog. Search results include the Tool name and Module location. Clicking the Tool navigation link opens the correct 'Tool Overview' page for the identified tool.
