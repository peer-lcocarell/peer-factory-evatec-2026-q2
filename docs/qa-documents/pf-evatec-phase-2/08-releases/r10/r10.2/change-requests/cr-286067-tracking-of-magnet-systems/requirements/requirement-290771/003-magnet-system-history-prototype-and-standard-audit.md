# R10.2 Update for CR 286067 - Magnet System History: Verify Prototype and Define as Standard events are recorded with type links (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290771
Requirement: Magnet System History (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists in a state that supports creating a Prototype version.
- The user can perform Define as Standard action from the Prototype version.
- The 'Magnet System History' view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System and navigate to the History view. | The History view loads and existing entries are visible. |
| 2 | Execute the action to create a Prototype version of the Magnet System. | Prototype creation completes successfully. |
| 3 | Re-open the History view. | A Prototype history entry is present with acting user, timestamp, summary text, and a link to the Magnet System Type. |
| 4 | Select the Magnet System Type link in the Prototype entry. | The related Magnet System Type details open successfully. |
| 5 | Execute the action to Define as Standard from the Prototype version. | Define as Standard completes successfully. |
| 6 | Re-open the History view. | A Define as Standard history entry is present with acting user, timestamp, summary text, and a link to the Magnet System Type. |
| 7 | Select the Magnet System Type link in the Define as Standard entry. | The related Magnet System Type details open successfully. |

## Expected Outcome
Prototype creation and Define as Standard actions generate distinct history entries. Each entry includes acting user, timestamp, meaningful summary, and a working link to the Magnet System Type.
