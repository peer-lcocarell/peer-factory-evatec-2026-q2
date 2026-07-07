# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify import updates metadata on linked Magnet System Types when ERP data changes (Integration)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 264374
Requirement: Import hardware components from file (Hardware Components)

## Preconditions
- User is signed in with `ManageHardware_Edit`, `ManageHardware_View`, and `MagnetSystemType_View` permissions.
- A Magnet System Type exists that was created from a Hardware Component Article Number.
- The ERP source data for that Hardware Component has been updated (for example the ERP Status or Successor field has changed).
- An updated hardware component import file reflecting the changes is available.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the current ERP Status and Successor values on the linked Magnet System Type. | Baseline ERP-sourced field values are captured. |
| 2 | Open the 'Hardware Components' import screen and upload the updated import file. | Import starts without format errors. |
| 3 | Review the import completion summary. | Summary indicates the Hardware Component record was updated (not skipped or rejected). |
| 4 | Navigate to the 'Magnet System Types' page and open the linked Magnet System Type. | The Magnet System Type record loads. |
| 5 | Compare the ERP Status and Successor fields against the updated import data. | The ERP-sourced fields on the Magnet System Type reflect the updated values from the import. The change is propagated from the Hardware Component to the linked Magnet System Type. |

## Expected Outcome
Re-importing a Hardware Component with updated ERP data propagates the changes to the linked Magnet System Type. ERP-sourced fields (ERP Status, Successor) on the Magnet System Type are updated to reflect the new import data. User-entered fields are not overwritten.
