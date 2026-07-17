# R10.2 Update for CR 286067 - New Magnet System: Verify a magnet system cannot be created with a serial number already in use (Unhappy Path)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists with a known serial number.
- A valid Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System' form and select the available Magnet System Type. | Form opens with serial number field. |
| 2 | Enter the serial number already in use by the existing magnet system. | A validation error is displayed stating the serial number is already in use. Save is disabled. |
| 3 | Clear the serial number field and enter a unique serial number. | Validation error clears. Save becomes available. |

## Expected Outcome

The system blocks duplicate serial numbers on new Magnet System creation and allows save only after a unique serial number is entered.
