# R10.2 284111 Self-Service Box - Boxes List Combined Status and Entry Date Filters (Regression)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36297
- Requirement: Status and Entry Date filters operate together without regressions in list behavior.

## Preconditions

- User is signed in with `Boxes_View` permission.
- Data includes records across multiple statuses and entry dates.
- At least one known record matches combined criteria.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Apply a multi-select Status filter. | List updates to selected statuses only. |
| 2 | Apply Entry Date start/end range on top of status filter. | List shows intersection of status and date criteria only. |
| 3 | Open one matching record and return to list. | Combined filters remain applied and list context is preserved. |
| 4 | Refresh the page. | Combined filters persist and results remain stable. |
| 5 | Remove only date filter, keep status filter. | List updates correctly to status-only results. |
| 6 | Re-apply date filter, then clear only status filter. | List updates correctly to date-only results. |
| 7 | Clear all filters. | List returns to default state without residual filters. |

## Expected Outcome

Combined and independent filter operations remain stable, accurate, and persistent with no regression.
