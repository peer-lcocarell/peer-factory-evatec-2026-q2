# R10.2 Update for CR 286067 - Magnet Systems: Verify the Inspection Required and Retired filters function on the Magnet Systems list (Validation)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (List and Checkout)

## Metadata

- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`.
- At least one magnet system exists with the inspection-required flag set.
- At least one magnet system exists without the inspection-required flag.
- At least one magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | All active magnet systems are listed. |
| 2 | Apply the Inspection Required filter. | Only magnet systems with the inspection-required flag are displayed. |
| 3 | Clear the filter and apply the Retired status filter. | Only Retired magnet systems are displayed. |
| 4 | Clear the filter. | All magnet systems are displayed again. |

## Expected Outcome

Inspection Required and Retired filters return only matching records and reset correctly when cleared.
