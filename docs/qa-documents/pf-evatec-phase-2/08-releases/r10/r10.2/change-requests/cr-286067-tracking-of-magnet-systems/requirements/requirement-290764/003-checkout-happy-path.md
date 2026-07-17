# R10.2 Update for CR 286067 - Magnet Systems: Verify tester can check out an In Stock magnet system and a checkout history entry is recorded (Happy Path)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (List and Checkout)

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Stock status.
- The magnet system is not installed in any tool.
- A valid user and tool are available for selection.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and locate the In Stock record. | Record is visible with status In Stock. |
| 2 | Open the magnet system detail page. | 'Check Out' action is visible and enabled. |
| 3 | Click 'Check Out'. | Checkout dialog opens with fields for user and tool. |
| 4 | Select a user and select a tool. | Selected user and tool names are displayed in the dialog. |
| 5 | Confirm the checkout. | Detail page reflects the checkout state. No error message is shown. |
| 6 | Open the magnet system history. | A checkout entry exists with timestamp, actor identity, selected user name, and selected tool name. |

## Expected Outcome

Users with edit permission can check out an In Stock magnet system. Checkout persists and a history entry is recorded with timestamp, actor, selected user, and selected tool.
