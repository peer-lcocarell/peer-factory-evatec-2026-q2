# R10.2 Update for CR 285729 - Search Hardware: Verify access is denied when HardwareConfiguration_View permission is missing (Negative)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components (Common Hardware Configuration)

## Preconditions
- Tester account A has `HardwareConfiguration_View` permission.
- Tester account B does not have `HardwareConfiguration_View` permission.
- At least one tool or module context exists where Search Hardware is normally available for authorized users.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as account A and open a page where 'Search Hardware' is normally available. | The 'Search Hardware' action is visible and can be opened. |
| 2 | Sign out and sign in as account B without `HardwareConfiguration_View`. | The session is established with restricted permissions. |
| 3 | Open the same page and check available actions. | The 'Search Hardware' action is not visible for account B. |
| 4 | Attempt direct navigation to Search Hardware using a saved URL or deep link. | Access is denied and the feature does not open. An authorization response is shown according to system behavior. |

## Expected Outcome
Users without `HardwareConfiguration_View` cannot access Search Hardware through UI actions or deep links. Unauthorized access is blocked consistently.
