# R10.2 Update for CR 285729 - Search for Installed Hardware Components: Verify installation date range filter narrows search results (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permission to use Hardware Search.
- Installed hardware components with different historical installation dates exist.
- Hardware Search supports installation date range filtering.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Search and run a broad search returning multiple installed components. | Baseline result set is displayed. |
| 2 | Apply an installation date range that includes only a subset of records. | Result set narrows to installations within the selected range. |
| 3 | Change the date range to a non-matching period. | No results are returned for the selected range. |
| 4 | Clear the date range filter. | Full baseline result set is restored. |

## Expected Outcome
Installation date range filter correctly narrows and restores installed hardware search results.
