# R10.2 Update for CR 286067 - New Target Type from ERP: Attempt to create a Target Type using an article already assigned as a Magnet System Type (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- A Hardware Component exists that is already assigned as a Magnet System Type.
- The 'Targets' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the 'Targets' page and start creating a new Target. | The Target Type selection dialog is displayed. |
| 2 | Open the ERP article selector. | The ERP article selector loads. |
| 3 | Search for and locate the Hardware Component already assigned as a Magnet System Type. | The article is returned in search results but is identified as ineligible. |
| 4 | Attempt to select the ineligible article and continue with target creation. | The article cannot be selected or cannot be confirmed for creation. An informational message indicates the article is already in use as a Magnet System Type. |
| 5 | Select a valid unassigned ERP article and continue. | The valid article can be selected and target creation flow proceeds normally. |
| 6 | Reopen the selector and search the previously ineligible article again. | The same article remains ineligible and still cannot be used as a Target Type source. |

## Expected Outcome
Hardware Components already assigned as a Magnet System Type are consistently blocked from Target Type creation with a clear informational message. Valid unassigned ERP articles remain selectable.
