# R10.2 Update for CR 285729 - Modules: Verify docked module scope filter returns only docked module results (Happy Path)

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
| 2 | Apply the Docked module scope filter. | The scope filter is applied. |
| 3 | Review the results. | All returned results show modules that are docked to a tool. No undocked module results are present. |
| 4 | Verify the location field for each result. | Each result displays a tool and module location, confirming the module is docked. |
| 5 | Clear the scope filter. | Results return to the unfiltered set and include both docked and undocked module installations. |

## Expected Outcome
Applying the Docked scope filter returns only hardware installed on docked modules. Hardware on undocked modules is excluded. Clearing the filter restores the full result set.
