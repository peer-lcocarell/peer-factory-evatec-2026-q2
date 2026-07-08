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
- Target range boundaries are known and include at least one record on each boundary date.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Set Entry Date `Start Date` and `End Date` for a known valid range. | List updates to show only records within the selected date range. |
| 2 | Verify records with Entry Date equal to the selected `Start Date`. | Boundary records at the start date are included per requirement behavior. |
| 3 | Verify records with Entry Date equal to the selected `End Date`. | Boundary records at the end date are included per requirement behavior. |
| 4 | Verify that records before `Start Date` and after `End Date` are excluded. | No out-of-range records are displayed in the result set. |
| 5 | Change date range to a period with no matching records. | List shows no records (or explicit empty state) without system error. |
| 6 | Refresh the page while date filter remains applied. | Entry Date filter values persist and filtered results are restored after reload. |
| 7 | Open filtered URL in a new browser tab/session. | Same date range criteria are applied and result set remains consistent. |
| 8 | Clear Entry Date filters. | Full, unfiltered result set is restored and date filter controls are reset. |

## Expected Outcome
Entry Date range filtering correctly handles in-range and boundary-date behavior, excludes out-of-range records, and preserves filter state across reload and URL navigation.
