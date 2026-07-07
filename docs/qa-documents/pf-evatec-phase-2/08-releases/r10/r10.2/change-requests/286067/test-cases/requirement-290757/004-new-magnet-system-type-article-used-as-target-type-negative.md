# R10.2 Update for CR 286067 - New Magnet System Type: Attempt to create a Magnet System Type using an article already assigned as a Target Type (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Hardware Component exists that is already assigned as a Target Type.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select 'New'. | The ERP article selector is displayed. |
| 2 | Search for and locate the Hardware Component that is already assigned as a Target Type. | The article is returned in search results but is identified as ineligible (already used as a Target Type). |
| 3 | Attempt to select the ineligible article. | The article cannot be selected. An informational message is displayed indicating it is already in use as a Target Type or Magnet System Type. |
| 4 | Select a different article that is not assigned to any Target Type or Magnet System Type. | The article is selected and ERP-derived fields populate in the form. |

## Expected Outcome
Hardware Components already assigned as a Target Type are not available for selection when creating a new Magnet System Type. An informational message explains the restriction. A valid unassigned article can be selected without restriction.
