# R10.2 Update for CR 285729 - Modules: Verify module location information remains accurate for historical installation records (Regression)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 226372
Requirement: Modules (Modules)

## Preconditions
- User is signed in with `Modules_View` and `HardwareConfiguration_View` permissions.
- Historical hardware installation records exist for a component that has been moved between modules.
- The original module location (module name and tool) is known.
- The 'Hardware Search' feature supports date-range filtering for historical records.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Search for a known moved component using a date range that includes its earlier installation period. | A historical result is returned. |
| 2 | Verify the historical Module location value. | Location matches the known historical module, not the current module. |
| 3 | Run a current-date search for the same component. | Current and historical locations are different and both are displayed correctly for their contexts. |
| 4 | Open the Module link from the historical result. | Navigation succeeds and resolves to the expected module reference for that record. |

## Expected Outcome
Historical results show module location at installation time, current results show current location, and location history is not overwritten.
