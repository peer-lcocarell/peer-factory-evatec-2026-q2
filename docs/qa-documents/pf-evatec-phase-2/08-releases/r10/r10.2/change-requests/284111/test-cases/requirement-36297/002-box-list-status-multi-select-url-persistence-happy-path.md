# R10.2 Update for CR 284111 - Boxes List: Verify Status multi-select filtering and URL persistence (Happy Path)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36297
Requirement: Boxes list supports multi-select Status filtering and preserves filter state in URL.

## Preconditions
- User is signed in with `Boxes_View` permission.
- Test data includes boxes in at least three distinct statuses.
- User is on the `Boxes` list page.
- The selected statuses each have at least one known record.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Status filter and select one status value. | List updates to show only records for the selected status and result count changes accordingly. |
| 2 | Add a second status value in the same filter. | List updates to include records matching either selected status. |
| 3 | Add a third status value and apply filter. | Results reflect union of all selected statuses with no unrelated status values shown. |
| 4 | Verify several visible rows after multi-select is applied. | Each visible row has a Status value contained in the selected status set only. |
| 5 | Refresh the page while filter remains applied. | Status selections persist and the same filtered result set is restored after reload. |
| 6 | Open one filtered record and navigate back to list. | Previously selected statuses remain active and filtered results are preserved. |
| 7 | Open the URL in a new browser tab/session. | Same status filter selections are applied and same status-constrained result set is loaded. |
| 8 | Clear Status filter selections. | Full, unfiltered list is restored with no stale status criteria retained. |

## Expected Outcome
Status filter reliably supports multiple simultaneous selections, limits results to selected statuses only, and preserves filter state across refresh, navigation, and URL reuse.
