# R10.2 Update for CR 286067 - Magnet Systems: Verify list-level actions are available based on tester permissions (Security)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (List and Checkout)

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester A is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- Tester B is signed in with `MagnetSystem_View` only.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | As Tester A open the 'Magnet Systems' list. | 'New' or create action is visible. |
| 2 | As Tester B open the 'Magnet Systems' list. | 'New' or create action is hidden or disabled. |

## Expected Outcome

List-level actions follow user permissions. Users with edit rights can create, while view-only users cannot.
