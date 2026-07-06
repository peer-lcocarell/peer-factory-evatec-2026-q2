# R10.2 Update for CR 286836 - Search for Installed Hardware Components: Verify no results are returned for invalid search criteria (Negative)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permissions to view/search installed hardware components.
- Installed hardware component data exists.
- Search page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open installed hardware components search page. | Search page opens successfully. |
| 2 | Enter invalid/non-matching search criteria and execute search. | Search executes without system error. |
| 3 | Review result grid and messages. | No matching records are returned and no-results feedback is displayed. |
| 4 | Clear criteria and search again with valid values. | Matching records can be returned normally. |

## Expected Outcome
Invalid criteria returns no results with clear feedback and does not break normal search behavior.
