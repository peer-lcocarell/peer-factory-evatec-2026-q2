# R10.2 Update for CR 285729 - Search Hardware: Verify partial-match search criteria for article, description, and serial number (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components (Common Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- At least one installed hardware component has known values for article number, article name, and serial number.
- Search criteria values allow partial matching in the environment.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Search Hardware' and enter a partial Article # value for a known component. Run search. | A matching result is returned for that component. Article and Location columns are populated. |
| 2 | Clear criteria, enter a partial Description value for the same known component, and run search. | A matching result is returned for that component. Article and Location columns are populated. |
| 3 | Clear criteria, enter a partial Serial # value for the same known component, and run search. | A matching result is returned for that component. Article and Location columns are populated. |
| 4 | Compare returned rows across the three searches. | Returned rows consistently identify the expected installed component location. |

## Expected Outcome
Partial-match searches by Article #, Description, and Serial # return correct installed hardware results with valid Article and Location values.
