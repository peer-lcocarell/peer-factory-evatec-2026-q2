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
| 1 | Open 'Hardware Search' without a module scope filter. | The baseline result set is displayed. |
| 2 | Apply the Docked module scope filter. | Only docked module results remain; undocked module results are excluded. |
| 3 | Verify location values in filtered rows. | Each row shows tool and module information consistent with docked state. |
| 4 | Clear the scope filter. | Baseline unfiltered results are restored. |

## Expected Outcome
Docked scope filtering returns only docked module installations and clearing the filter restores the baseline result set.
