# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify docked and undocked module scope filters return correct results (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- Hardware components are installed across both docked and undocked modules.
- Hardware Search supports docked/undocked module scope filtering.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Search and run a broad search with no scope filter. | Combined results include docked and undocked module installations. |
| 2 | Apply the Docked module scope filter. | Only hardware installed on docked modules is returned. |
| 3 | Apply the Undocked module scope filter. | Only hardware installed on undocked modules is returned. |
| 4 | Clear the scope filter. | Combined result set is restored. |

## Expected Outcome
Docked and undocked module scope filters correctly partition installed hardware search results.
