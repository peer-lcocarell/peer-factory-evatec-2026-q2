# R10.2 Update for CR 286067 - Magnet Systems: Verify checkout is blocked for magnet systems not in In Stock status (Unhappy Path)

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
- One magnet system exists in In Use status.
- One magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Use magnet system detail page. | 'Check Out' action is not present or is disabled. |
| 2 | Open the Retired magnet system detail page. | 'Check Out' action is not present or is disabled. |
| 3 | Open history for both records. | No new checkout history entry exists on either record. |

## Expected Outcome

Checkout is blocked for magnet systems that are not in In Stock status. No checkout history entry is created when checkout is unavailable.
