# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can promote a Prototype Magnet System Type to Standard from the list page (Happy Path)

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Requirement: Magnet System Types (Magnet System Types)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystems_Modify`.
- A second user exists without `MagnetSystems_Modify`.
- A Prototype Magnet System Type (V01) exists with a linked Hardware Component available for promotion.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list page and locate the V01 prototype. | Prototype is listed with Prototype indicator and variant code V01. |
| 2 | Open the prototype detail page and start the 'Define as Standard' action. | Promotion dialog opens. |
| 3 | Link the valid Hardware Component and confirm. | Type is promoted to Standard. Prototype indicator and variant code are removed. |
| 4 | Refresh the 'Magnet System Types' list. | Type appears in the list with Standard status. |
| 5 | Log out and sign in as a user without `MagnetSystems_Modify`. Open a Prototype Magnet System Type. | The 'Define as Standard' action is not visible or is disabled. The user cannot perform the promotion. |

## Expected Outcome

A user with `MagnetSystems_Modify` can promote a Prototype Magnet System Type to Standard from the list workflow. A user without that permission cannot perform the action.
