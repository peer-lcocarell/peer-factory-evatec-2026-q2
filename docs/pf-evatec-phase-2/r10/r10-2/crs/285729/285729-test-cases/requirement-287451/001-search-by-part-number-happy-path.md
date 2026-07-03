# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify search by Part Number returns matching installed hardware (Happy Path)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- At least one installed hardware component with a known Part Number exists.
- Hardware Search dialog is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Hardware Search dialog. | Search dialog loads successfully. |
| 2 | Enter a valid Part Number for a known installed hardware component. | Search executes without errors. |
| 3 | Review returned results. | Matching hardware components are displayed with Tool and Module details. |
| 4 | Open one returned record via navigation link. | Correct hardware location is displayed. |

## Expected Outcome
Searching by Part Number returns accurate installed hardware component results with correct location details.
