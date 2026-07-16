# R10.2 284111 Self-Service Box - Boxes List Self-Service Filter Yes No and Clear (Happy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36297
- Requirement: Self-Service column supports Yes/No dropdown filter and returns correct results.

## Preconditions

- User is signed in with `Boxes_View` permission.
- Data includes at least one box with `IsSelfServe = true` and one with `IsSelfServe = false`.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Self-Service column filter dropdown. | Filter options include Yes and No. |
| 2 | Select `Yes`. | List updates to show only self-service boxes. |
| 3 | Verify no non-self-service records appear. | All displayed rows show `Self-Service = Yes`. |
| 4 | Change filter to `No`. | List updates to show only non-self-service boxes. |
| 5 | Verify no self-service records appear. | All displayed rows show `Self-Service = No`. |
| 6 | Clear the Self-Service filter. | List returns to full unfiltered result set. |
| 7 | Apply Self-Service = Yes and a Status filter together. | List shows only self-service boxes matching the selected status. |

## Expected Outcome

Self-Service dropdown filter returns accurate results for Yes, No, and combined filter scenarios.
