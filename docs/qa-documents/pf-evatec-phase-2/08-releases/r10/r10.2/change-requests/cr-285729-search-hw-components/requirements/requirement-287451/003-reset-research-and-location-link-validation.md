# R10.2 Update for CR 285729 - Search Hardware: Verify reset, re-search, and location link behavior (Scenario)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components (Common Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- At least one installed component exists on a tool and at least one installed component exists on a module.
- Search results provide a Location link for each result row.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Run a search that returns at least one known result. | Result rows are displayed with Article and Location data. |
| 2 | Select RESET. | Search criteria fields return to default values and previous filtered result state is cleared. |
| 3 | Enter a different valid criterion and run search again. | A new result set is returned based on updated criteria only. |
| 4 | Open a Location link from a returned row. | Navigation opens the corresponding hardware configuration context for the selected tool or module. |

## Expected Outcome
RESET returns the dialog to a clean default state, re-search uses only the updated criteria, and Location links navigate to the correct hardware configuration context.
