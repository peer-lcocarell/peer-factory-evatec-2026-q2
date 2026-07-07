# R10.2 Update for CR 286067 - Magnet Systems: Verify the Inspection Required filter and Retired status filter function correctly in the Magnet Systems list (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- Magnet Systems with Inspection Required flag set to `Yes` and `No` both exist.
- Magnet Systems in both active statuses (`In Stock`, `In Use`, `In Inspection`) and `Retired` status exist.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page with no filters applied. | All Magnet Systems including Retired ones are displayed (or the default view shows active records — note the default behavior). |
| 2 | Apply the Inspection Required filter to show only Magnet Systems with Inspection Required = `Yes`. | Only records with the Inspection Required flag set to `Yes` are displayed. |
| 3 | Remove the Inspection Required filter. | All records are displayed again (within the active/all filter). |
| 4 | Apply a filter to show only `Retired` Magnet Systems. | Only Magnet Systems with status `Retired` are displayed. Active records are hidden. |
| 5 | Apply a filter to show only active Magnet Systems (non-Retired). | Only Magnet Systems with status `In Stock`, `In Use`, or `In Inspection` are displayed. `Retired` records are hidden. |
| 6 | Combine the Inspection Required filter with the active status filter. | Only records matching both criteria (Inspection Required = Yes AND active status) are displayed. |

## Expected Outcome
The 'Magnet Systems' list supports filtering by Inspection Required flag and by Retired/active status. Each filter correctly reduces the visible records to only those matching the criteria. Combined filters apply both conditions simultaneously.
