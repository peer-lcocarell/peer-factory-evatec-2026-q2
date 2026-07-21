---
TestCaseId: 293474
PlanId: 291616
SuiteId: 292264
---

# R10.2 Update for CR 286067 - New Magnet System Type: Attempt to create a Magnet System Type using an article already assigned as a Magnet System Type

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- A Hardware Component exists that is already assigned to a Magnet System Type.
- The Magnet System Types page is accessible.

## Test Steps

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. | The ERP article selector is displayed. |
| 2 | Search for the Hardware Component that is already assigned to a Magnet System Type. | The Hardware Component is not selectable in the article selector. |
| 3 | Enter the article number directly in the search field and attempt to confirm the selection. | A message is displayed indicating the article cannot be used. The New Magnet System Type form does not open for that article. |
| 4 | Search for and select a Hardware Component that is not assigned as a Target Type or Magnet System Type. | The article is accepted. The ERP-derived fields are populated in the New Magnet System Type form. |

## Expected Outcome
- Hardware Components already assigned to a Magnet System Type are not selectable in the article selector.
- Entering the article number directly does not open the creation form. A message is displayed indicating the article cannot be used.
- An eligible Hardware Component is accepted and populates the ERP-derived fields.
