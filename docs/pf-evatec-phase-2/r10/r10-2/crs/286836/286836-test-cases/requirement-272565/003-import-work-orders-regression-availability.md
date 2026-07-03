# R10.2 Update for CR 286836 - Import Work Orders from File: Verify imported work orders are available for processing after import (Regression)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 272565
Requirement: Import work orders from file (Work Orders)

## Preconditions
- User is signed in with permissions to import Work Orders and use downstream pages that consume Work Orders.
- A valid import file is available.
- At least one workflow that consumes Work Orders is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Import work orders from a valid file. | Import completes successfully. |
| 2 | Open a downstream screen that uses Work Orders (for example Box creation or related selection flow). | Work Order selector is available. |
| 3 | Search/select one of the newly imported work orders. | Imported work order can be found and selected. |
| 4 | Save/continue the consuming workflow. | Workflow accepts imported work order without errors. |

## Expected Outcome
Imported work orders are available and usable in downstream processing workflows after import.
