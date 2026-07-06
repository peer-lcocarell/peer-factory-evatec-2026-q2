# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify historical hardware installation records are searchable (Regression)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- Historical hardware installation records exist for components no longer currently installed.
- Hardware Search dialog supports current and historical installation searches.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Search and run a search that includes a historically installed component. | Search returns matching historical result. |
| 2 | Verify the result differentiates current vs historical installation status. | Current/historical distinction is displayed correctly. |
| 3 | Navigate to the related Tool/Module for a historical result. | Navigation opens the correct related location where applicable. |
| 4 | Apply an installation date range that includes historical installations. | Historical records are returned according to the date range. |

## Expected Outcome
Historical hardware installation records are searchable and correctly distinguished from current installations.
