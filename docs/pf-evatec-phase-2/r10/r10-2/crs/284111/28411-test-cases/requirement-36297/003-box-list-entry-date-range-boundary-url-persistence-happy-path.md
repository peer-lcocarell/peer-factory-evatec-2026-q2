# R10.2 Update for CR 284111 - Boxes List: Verify Entry Date range filtering and boundary handling (Happy Path)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36297
Requirement: Boxes list supports Entry Date start/end range filtering with expected boundary behavior and URL persistence.

## Preconditions
- User is signed in with `Boxes_View` permission.
- Test data exists with Entry Date values before, within, and after a known target range.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Set Entry Date `Start Date` and `End Date` for a known valid range. | List updates to show only records within the selected date range. |
| 2 | Verify records on boundary dates (equal to start or end date). | Boundary-date records are handled according to requirement and included when expected. |
| 3 | Change date range to a non-matching period. | List shows no records (or explicit empty state) without system error. |
| 4 | Refresh/reopen using the filtered URL. | Entry Date filter values persist and filtered results are restored. |
| 5 | Clear Entry Date filters. | Full, unfiltered result set is restored. |

## Expected Outcome
Entry Date range filtering works across normal and boundary scenarios, and filter state persists through URL reload/navigation.
