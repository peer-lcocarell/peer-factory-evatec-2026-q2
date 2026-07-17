# R10.2 Update for CR 286067 - Magnet Systems: Verify checkout action is not available without edit permission (Security)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (List and Checkout)

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View` only.
- Tester does not have `MagnetSystem_Edit`.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | List is visible. In Stock record is visible. |
| 2 | Open the In Stock magnet system detail page. | 'Check Out' action is hidden or disabled. No checkout can be initiated. |
| 3 | Attempt direct URL navigation to the checkout endpoint if the route is known. | Access is denied. No checkout change is persisted. No history entry is created. |

## Expected Outcome

Users without edit permission cannot execute checkout from UI or direct navigation. No checkout state change or history entry is produced.
