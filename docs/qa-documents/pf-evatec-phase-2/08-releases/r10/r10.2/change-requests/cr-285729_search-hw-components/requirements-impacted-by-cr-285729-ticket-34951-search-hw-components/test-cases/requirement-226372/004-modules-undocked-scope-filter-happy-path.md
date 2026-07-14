# R10.2 Update for CR 285729 - Modules: Verify undocked module scope filter returns only undocked module results (Happy Path)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 226372
Requirement: Modules (Modules)

## Preconditions
- User is signed in with `Modules_View` and `HardwareConfiguration_View` permissions.
- Hardware components are installed on both docked and undocked modules.
- The 'Hardware Search' feature is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Hardware Search' with no scope filter applied. | Results include hardware installed on both docked and undocked modules. |
| 2 | Apply the Undocked module scope filter. | The scope filter is applied. |
| 3 | Review the results. | All returned results show modules that are not currently docked to a tool. No docked module results are present. |
| 4 | Verify the location field for each result. | Each result shows a configured location (not a live tool-and-module docking location), confirming the module is undocked. |
| 5 | Clear the scope filter. | Results return to the unfiltered set and include both docked and undocked module installations. |

## Expected Outcome
Applying the Undocked scope filter returns only hardware installed on undocked modules. Hardware on docked modules is excluded. Clearing the filter restores the full result set.
