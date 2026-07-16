# R10.2 Update for CR 286067 - Magnet Systems: Verify the Inspection Required filter and Retired status filter function correctly in the Magnet Systems list (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystems_View` permission.
- Magnet Systems with Inspection Required flag set to `Yes` and `No` both exist.
- One Magnet System has last inspection older than one year.
- One Magnet System has last inspection equal to one year or newer.
- Magnet Systems in active statuses `In Stock`, `In Use`, `In Inspection` and `Retired` status exist.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and set the list toggle to show All Magnet Systems including retired. | Active and retired records are visible in one list view. |
| 2 | Verify Inspection Required flags for prepared inspection-date records. | The record with last inspection older than one year is flagged Inspection Required = `Yes`. The record inspected at one year or newer is not flagged. |
| 3 | Apply Inspection Required filter for `Yes`. | Only records flagged Inspection Required = `Yes` are displayed. |
| 4 | Switch toggle to Active Magnet Systems only while keeping Inspection Required filter active. | Only active records that are also Inspection Required = `Yes` remain visible. |
| 5 | Capture current list URL with active toggle and filters applied, then refresh or open the copied URL in a new tab. | Sorting and filtering state is preserved from the URL and the same dataset is restored. |
| 6 | Return to All Magnet Systems and filter status to `Retired`. Select a retired record and open available actions. | Retired record can be viewed. Measure or retire operations are not available for retired records. |

## Expected Outcome
Inspection Required flag behavior follows the one-year rule. Active and all toggles work with filters and preserve state in URL. Retired records remain view-only and do not expose measure or retire operations.
