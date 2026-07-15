# R10.2 Update for CR 285729 - Modules: Verify Hardware Search returns no results for unmatched criteria

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 226372
Requirement: Modules (Modules)

## Preconditions
- User is signed in with `Modules_View` and `HardwareConfiguration_View` permissions.
- The 'Hardware Search' feature is accessible from the 'Modules' page.
- The tester knows at least one search term that is guaranteed not to match any installed hardware component (e.g., a serial number or part number that does not exist in the system).

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Hardware Search' from the 'Modules' page. | Search dialog opens with empty criteria fields. |
| 2 | Search using a known non-existent part number. | Search completes with a no-results message and no result rows. |
| 3 | Search using a known non-existent serial number. | Search completes with a no-results message and no result rows. |
| 4 | Review the results area in no-results state. | No navigation links, tool names, or module location values are shown. |
| 5 | Modify criteria after no-results state and keep dialog open. | Criteria fields remain editable without page reload. |

## Expected Outcome
When search criteria produce zero matches, the dialog shows a clear no-results state with no data rows or links, and criteria remain editable for immediate retry.
