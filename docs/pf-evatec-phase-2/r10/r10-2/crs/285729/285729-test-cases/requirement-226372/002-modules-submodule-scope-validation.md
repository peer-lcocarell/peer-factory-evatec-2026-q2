# R10.2 Update for CR 285729 - Modules: Verify submodule locations are correctly reported in search results (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 226372
Requirement: Modules (Modules)

## Preconditions
- User is signed in with permission to view Modules and use Hardware Search.
- At least one hardware component is installed on a submodule within a parent module.
- Docked and undocked module examples exist for scope testing.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Search and search for a component known to be installed on a submodule. | Search returns matching results. |
| 2 | Verify the reported Module/Submodule location in the result. | Result displays both parent module and submodule accurately. |
| 3 | Navigate to the module from the search result. | Correct submodule location is opened. |
| 4 | Repeat the search with docked/undocked scope filters. | Results correctly reflect docked vs undocked module scope. |

## Expected Outcome
Search results accurately identify submodule locations and respect docked/undocked scope filtering.
