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

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. | The ERP article selector is displayed. |
| 2 | Search for the Hardware Component that is already assigned to a Magnet System Type. | The Hardware Component is displayed in the search results. |
| 3 | Attempt to select the Hardware Component. | The Hardware Component cannot be used to create a new Magnet System Type. An appropriate validation or informational message is displayed. |
| 4 | Attempt to continue the creation process using the Hardware Component. | Creation of the Magnet System Type is blocked. |
| 5 | Select a Hardware Component that is not assigned to a Target Type or Magnet System Type. | The Hardware Component is accepted and the ERP-derived fields are populated. |

## Expected Outcome
- Hardware Components already assigned to a Magnet System Type cannot be used to create another Magnet System Type.
- Creation is blocked when an ineligible Hardware Component is selected.
- An eligible Hardware Component can be selected successfully and creation can proceed.
