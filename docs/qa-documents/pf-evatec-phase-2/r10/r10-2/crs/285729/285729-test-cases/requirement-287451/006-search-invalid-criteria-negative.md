# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify no results are returned for invalid search criteria (Negative)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- Installed hardware component data exists.
- Hardware Search dialog is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Search. | Search dialog loads successfully. |
| 2 | Enter non-matching Part Number, Serial Number, or Description criteria. | Search executes without system errors. |
| 3 | Review results and any no-results feedback. | No matching records are returned and no-results messaging is displayed. |
| 4 | Clear criteria and enter valid criteria. | Matching records are returned normally. |

## Expected Outcome
Invalid search criteria return no results with clear feedback and do not disrupt normal search operations.
