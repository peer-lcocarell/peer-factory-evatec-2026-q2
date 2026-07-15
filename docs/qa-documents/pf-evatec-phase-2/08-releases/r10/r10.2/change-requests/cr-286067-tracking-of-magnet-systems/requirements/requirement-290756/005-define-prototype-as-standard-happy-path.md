# R10.2 Update for CR 286067 - Magnet System Types: Define Prototype as Standard

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists with `MagnetSystems_Modify` permission.
- A second user account exists without `MagnetSystems_Modify` permission.
- At least one Magnet System Type record exists with a Prototype designation.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as the user with `MagnetSystems_Modify` permission and navigate to the 'Magnet System Types' page. | The page loads and displays the list of Magnet System Types. |
| 2 | Select a Magnet System Type with a Prototype designation. | The detail view is displayed. The record is identified as Prototype. An option to define the record as Standard is visible and enabled. |
| 3 | Click the option to define the Magnet System Type as Standard and confirm the action. | The designation is updated from Prototype to Standard. The change is reflected in the detail view and in the list. |
| 4 | Log out and log in as the user without `MagnetSystems_Modify` permission. Select a Prototype Magnet System Type. | The detail view is displayed. The option to define the record as Standard is not available or is disabled. |

## Expected Outcome
A user with `MagnetSystems_Modify` permission can convert a Prototype Magnet System Type to Standard. A user without that permission cannot perform the conversion.
