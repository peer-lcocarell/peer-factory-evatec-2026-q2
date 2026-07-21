# R10.2 Update for CR 286067 - View Magnet System: Verify state-sensitive fields display correct values for each lifecycle status (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- One prepared Magnet System record exists for each status: `In Stock`, `In Use`, `In Inspection`, and `Retired`.
- Baseline values are available for each prepared record:
	- Magnet System Number and Serial Number
	- Expected status value
	- For `In Use`: expected tool name, checked out user, and checkout timestamp
	- For `Retired`: expected retire date and expected retire reason
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and open the View page for the prepared `In Stock` record. | The View page loads for the selected record. Status displays `In Stock`. |
| 2 | Read conditional fields on the `In Stock` record. | Location is empty. Checked Out To, Checked Out At, Retire Date, and Reason fields are not displayed. |
| 3 | Return to the list and open the View page for the prepared `In Use` record. | The View page loads for the selected record. Status displays `In Use`. |
| 4 | Read conditional fields on the `In Use` record. | Location displays the expected tool name. Checked Out To displays the expected user. Checked Out At displays the expected checkout timestamp. Retire Date and Reason fields are not displayed. |
| 5 | Return to the list and open the View page for the prepared `In Inspection` record. | The View page loads for the selected record. Status displays `In Inspection`. |
| 6 | Read conditional fields on the `In Inspection` record. | Location is empty. Checked Out To, Checked Out At, Retire Date, and Reason fields are not displayed. |
| 7 | Return to the list and open the View page for the prepared `Retired` record. | The View page loads for the selected record. Status displays `Retired`. |
| 8 | Read conditional fields on the `Retired` record. | Location is empty. Retire Date displays the expected retirement date. Reason displays the expected retirement reason. Checked Out To and Checked Out At fields are not displayed. |
| 9 | Compare field visibility patterns across all four viewed records. | Conditional fields are shown only for the statuses where they apply and are hidden for all other statuses. |

## Expected Outcome
State-sensitive field behavior is consistent and status-driven across all lifecycle states. Location, Checked Out To, and Checked Out At are shown only for `In Use`. Retire Date and Reason are shown only for `Retired`. For `In Stock` and `In Inspection`, non-applicable conditional fields are not displayed.
