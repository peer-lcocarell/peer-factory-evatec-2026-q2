# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify search by Serial Number returns matching installed hardware (Happy Path)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- At least one installed hardware component with a known Serial Number exists.
- Hardware Search dialog is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Hardware Search dialog. | Search dialog loads successfully. |
| 2 | Enter a valid Serial Number for a known installed hardware component. | Search executes successfully. |
| 3 | Review returned results. | Matching component is returned with Tool and Module details. |
| 4 | Open the returned record via navigation link. | Correct hardware location and Serial Number are displayed. |

## Expected Outcome
Searching by Serial Number returns the correct installed hardware component with accurate location details.
