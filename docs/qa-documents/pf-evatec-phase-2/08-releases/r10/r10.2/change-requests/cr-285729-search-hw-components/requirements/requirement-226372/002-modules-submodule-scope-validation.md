# R10.2 Update for CR 285729 - Modules: Verify submodule locations are correctly reported in search results (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 226372
Requirement: Modules (Modules)

## Preconditions
- User is signed in with `Modules_View` and `HardwareConfiguration_View` permissions.
- At least one hardware component is installed on a submodule within a parent module.
- Both docked and undocked modules with installed hardware exist.
- The 'Hardware Search' feature is accessible from the 'Modules' page.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Search for a known component installed on a submodule. | A matching result is returned. |
| 2 | Verify the Module location format in that result. | Location shows both parent module and submodule identifier. |
| 3 | Open the Module link from the result. | The opened module detail matches the reported submodule location. |
| 4 | Re-run search with Docked and then Undocked scope filters. | Each scope returns only matching module state and excludes the opposite state. |

## Expected Outcome
Search results report submodule locations correctly, and docked-state scope filters return only records that match the selected scope.
