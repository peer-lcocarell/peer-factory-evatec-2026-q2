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
| 1 | Open 'Hardware Search' and search for the hardware component with a date range that covers the historical installation period. | The historical installation record is returned in the results. |
| 2 | Review the Module location in the historical result. | The Module location shown matches the module where the hardware was installed during the historical period — not the current location. |
| 3 | Compare with a current search for the same component (no date range). | The current result shows the current module location. The historical result shows the historical module location. The two locations differ as expected. |
| 4 | Click the Module navigation link on the historical result. | The correct historical module opens or a relevant reference is displayed. No navigation error occurs. |

## Expected Outcome
Historical installation records in Hardware Search report the module location at the time of installation, not the current location. Historical and current results for the same component show different module locations when the hardware has been moved. Historical module location data is not overwritten by current configuration.
