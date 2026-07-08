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
| 1 | Open Hardware Search and search for a component known to be installed on a submodule. | Search returns matching results. |
| 2 | Verify the reported Module location in the result. | The result displays both the parent module and the submodule identifier accurately. The location field is not empty or generic. |
| 3 | Click the Module navigation link in the search result. | The correct submodule location is opened. The submodule detail matches the location shown in the result. |
| 4 | Return to Hardware Search and apply the Docked module scope filter. Search again. | Only hardware installed on docked modules is returned. Hardware on undocked modules is excluded from the results. |
| 5 | Switch to the Undocked module scope filter. Search again. | Only hardware installed on undocked modules is returned. Hardware on docked modules is excluded from the results. |

## Expected Outcome
Search results accurately report the submodule location for hardware installed on submodules. The Docked scope filter returns only docked-module results and excludes undocked results. The Undocked scope filter returns only undocked-module results and excludes docked results.
