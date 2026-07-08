# R10.2 Update for CR 284111 - Boxes List: Verify combined Status and Entry Date filters with result consistency (Regression)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36297
Requirement: Boxes list supports combined filter behavior across Status and Entry Date without regression in navigation and record visibility.

## Preconditions
- User is signed in with `Boxes_View` permission.
- Test data includes records in multiple statuses across multiple Entry Dates.
- User is on the `Boxes` list page.
- At least one known record satisfies both chosen Status and Entry Date criteria.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Apply multi-select Status filter for two known statuses. | Only records matching selected statuses are displayed. |
| 2 | Apply Entry Date range filter on top of Status filter. | Results are narrowed to records matching both Status and date criteria. |
| 3 | Validate several rows in the filtered result set. | Each row satisfies both filter dimensions: status is selected and entry date is within selected range. |
| 4 | Open one filtered record and return to list. | Navigation succeeds and previously applied combined filters remain active. |
| 5 | Refresh the page while combined filters are active. | Combined filter values persist and result set remains unchanged after refresh. |
| 6 | Open the current filtered URL in a new browser tab/session. | Combined filter state is restored and the same intersection result set is shown. |
| 7 | Remove only the Entry Date filter while keeping Status filter. | Results expand to status-only filtered set, confirming independent filter behavior. |
| 8 | Clear all filters. | Full list is restored and no stale filter behavior remains. |

## Expected Outcome
Combined Status and Entry Date filtering works as an intersection, persists through navigation and URL reload, and can be independently adjusted without regressions.
