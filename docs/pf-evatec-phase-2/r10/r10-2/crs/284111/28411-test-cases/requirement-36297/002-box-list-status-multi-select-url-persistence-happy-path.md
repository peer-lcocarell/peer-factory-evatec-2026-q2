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

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Status filter and select one status value. | List updates to show only records for the selected status. |
| 2 | Add a second status value in the same filter. | List updates to include records matching either selected status. |
| 3 | Add a third status value and apply filter. | Results reflect union of all selected statuses with no unrelated status values shown. |
| 4 | Copy/refresh the current URL while filters remain applied. | Status filter selections persist and the same filtered result set is restored. |
| 5 | Clear Status filter selections. | Full, unfiltered list is restored. |

## Expected Outcome
Status filter supports multiple simultaneous selections and URL persistence reliably restores filter state.
