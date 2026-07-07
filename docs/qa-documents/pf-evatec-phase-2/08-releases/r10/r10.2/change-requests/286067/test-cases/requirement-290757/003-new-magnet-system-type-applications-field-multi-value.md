# R10.2 Update for CR 286067 - New Magnet System Type: Verify the Applications field accepts multiple values including custom entries (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A valid Hardware Component (ERP article) is available for Magnet System Type creation.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select 'New'. Select a valid ERP article. | The 'New Magnet System Type' form loads with ERP-derived fields populated. |
| 2 | Navigate to the Applications field. | The Applications field is displayed as a multi-select control with a list of predefined values. |
| 3 | Select two or more predefined values from the Applications list. | Multiple selections are accepted. Each selected value is displayed in the field. |
| 4 | Enter a custom Applications value that is not in the predefined list. | The custom value is accepted and added to the selections. |
| 5 | Save the new Magnet System Type. | Save completes without errors. |
| 6 | Re-open the Magnet System Type record. | The Applications field displays all selected values (including the custom value) as a comma-separated list. |

## Expected Outcome
The Applications field accepts multiple predefined values and custom free-text entries. All selected values persist after save. The field displays the comma-separated list of all selected values when the record is viewed.
