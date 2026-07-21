# R10.2 Update for CR 286067 - 'Manage Hardware' - Add Associations: Verify initial population, keyword filtering, full text search, and multiple selection for Magnet System associations

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205379
Requirement: Add associations (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- A source role/component exists with at least one previously installed Standard Magnet System Type.
- Keyword configuration exists for the selected role, including at least one matching and one non-matching Standard Magnet System Type.
- Multiple Standard Magnet System Type targets are available for selection.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations', select the source role/component, and trigger 'Add Association' for Magnet System role scope. | Target list opens and includes previously installed Standard Magnet System Types for the selected role. |
| 2 | Review the initial list before entering any search text. | Keyword-matching Standard Magnet System Types are present in the initial filtered result set. |
| 3 | Enter full text search using a known matching value (for example name, source type, flexicat type, or description). | Matching Standard Magnet System Types are displayed in results. |
| 4 | Enter full text search using a non-matching value. | No matching targets are displayed. |
| 5 | Clear search and select two or more Standard Magnet System Type targets. | Multiple selections are accepted and shown as pending associations. |
| 6 | Save associations. | Save completes without validation errors. |
| 7 | Refresh and reopen 'Learned Associations' for the same source role/component. | All selected Standard Magnet System Type associations are displayed and persisted. |

## Expected Outcome
The Add Association dialog shows expected initial candidates, applies keyword-first filtering, supports full text search, accepts multiple Standard Magnet System Type selections, and persists all saved associations after refresh and reopen.
