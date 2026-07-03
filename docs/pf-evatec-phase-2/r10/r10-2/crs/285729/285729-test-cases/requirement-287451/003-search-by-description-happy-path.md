# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify search by Description returns matching installed hardware (Happy Path)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- At least one installed hardware component with a known Description exists.
- Hardware Search dialog is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Hardware Search dialog. | Search dialog loads successfully. |
| 2 | Enter a Description value matching a known installed hardware component. | Search executes successfully. |
| 3 | Review returned results. | Matching hardware components are displayed with Tool and Module details. |
| 4 | Refine using a partial Description match. | Search updates and returns expected partial matches. |

## Expected Outcome
Searching by Description returns accurate installed hardware component results including partial matches when supported.
