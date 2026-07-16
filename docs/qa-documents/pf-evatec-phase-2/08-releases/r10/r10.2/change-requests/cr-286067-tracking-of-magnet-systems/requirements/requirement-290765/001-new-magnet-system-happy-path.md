# R10.2 Update for CR 286067 - New Magnet System: Verify tester can create a new Magnet System using a valid Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystems_View` and `MagnetSystems_Create` permissions.
- At least one defined standard Magnet System Type exists.
- At least one prototype Magnet System Type exists.
- At least one existing Magnet System exists to compare generated Magnet System Number format.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select 'New'. | The 'New Magnet System' creation screen loads. |
| 2 | Review the Magnet System Type selector before choosing a type. | Only defined standard Magnet System Types are available for selection. Prototype Magnet System Types are not selectable. |
| 3 | Verify default Last Inspection Date and then change it to a past date. | Last Inspection Date defaults to current date. A past date is accepted. |
| 4 | Enter a unique Serial Number and select a valid standard Magnet System Type. | Required inputs are accepted and type-related fields are displayed as read only. |
| 5 | Save without entering a comment. | Save completes and user is redirected directly to the View Magnet System page. |
| 6 | Review the created record values. | Status is `In Stock`. Magnet System Number is generated in `MS####` format and is different from existing numbers. Entry date is today. Current location is blank. |
| 7 | Open Magnet System history for the created record. | A `Created` history entry exists for the new magnet system. |

## Expected Outcome
A new Magnet System can be created only from a standard Magnet System Type. Last Inspection Date defaults to current date and accepts past dates. On save PF redirects to View Magnet System page, generates a unique Magnet System Number in `MS####` format, sets status `In Stock`, sets entry date to today, leaves current location blank, and writes a `Created` history entry.
