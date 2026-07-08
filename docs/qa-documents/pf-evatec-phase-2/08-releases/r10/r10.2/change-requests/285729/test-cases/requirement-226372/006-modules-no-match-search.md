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
| 1 | Open the 'Modules' page and open the Hardware Search dialog. | The Hardware Search dialog opens. All search fields are empty. |
| 2 | Enter a part number that does not match any installed hardware component (e.g., `ZZNOTEXIST-9999`). | The part number is accepted in the search field without error. |
| 3 | Submit the search. | The search executes without error. A no-results message is displayed. No hardware component rows are returned in the results list. |
| 4 | Clear the search criteria and enter a serial number that does not exist in the system. Submit the search. | The search executes without error. A no-results message is displayed. No hardware component rows are returned in the results list. |
| 5 | Verify that the no-results state does not display navigation links, tool names, or module names. | No navigation links, tool names, or module location data appear in the results area when zero matches are found. |

## Expected Outcome
When the tester submits Hardware Search criteria that match no installed hardware components, the system displays a clear no-results message. No partial results, placeholder rows, or navigation links are rendered. The search field remains editable so the tester can revise the criteria without reloading the page.
