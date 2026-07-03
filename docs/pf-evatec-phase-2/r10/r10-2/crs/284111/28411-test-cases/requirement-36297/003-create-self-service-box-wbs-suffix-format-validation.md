# 'R10.2 Update for CR 284111' - 'Boxes': Self-Service Box - Box List Column and Combined Filters
## Requirement
CR: 284111
Ticket: 34682
Requirement: Box List includes Self-Service column, Self-Service filter, and Entry Date range filter.
## Preconditions
- User is signed in with `Boxes_View` permission.
- Test data includes both Self-Service and non-self-service boxes across different Entry Dates.
- User is on the `Boxes` list page with access to column chooser/filter controls.
- At least one Self-Service record exists inside and outside the intended date range.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Box List and verify visible columns. | Self-Service column is displayed. |
| 2 | Apply Self-Service filter to show only Self-Service boxes. | List shows only Self-Service records. |
| 3 | Add Entry Date range filter that narrows the current result set. | List shows only Self-Service records within the selected date range. |
| 4 | Change date range to a non-matching period and then clear all filters. | No results are shown for non-matching range, and full list returns after clearing filters. |
## Expected Outcome
Box List correctly exposes and applies Self-Service and Entry Date filters, including combined filtering behavior.
