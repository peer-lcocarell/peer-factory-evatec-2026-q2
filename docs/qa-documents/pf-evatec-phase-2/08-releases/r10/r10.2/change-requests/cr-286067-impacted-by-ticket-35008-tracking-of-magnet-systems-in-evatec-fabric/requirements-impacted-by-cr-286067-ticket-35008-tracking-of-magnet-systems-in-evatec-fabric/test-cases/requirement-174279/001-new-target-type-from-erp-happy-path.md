# R10.2 Update for CR 286067 - New Target Type from ERP: Verify target type imported from ERP is available for selection (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- ERP-imported Hardware Components with target-type mappings exist.
- The 'Targets' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Targets' page and start creating a new target. | The Select Target Type modal is displayed. |
| 2 | Choose the option to select a target type by ERP article. | The ERP article selector loads with available records. |
| 3 | Select a valid ERP-imported record with known source values (Article Number, Name, ERP Status). | The selected values are loaded into the target-type form and displayed exactly as provided by the ERP source record. |
| 4 | Review the form labels and identifiers before saving. | 'Article Number' is displayed as the identifier field and no 'BPS Number' label is shown in the dialog. |
| 5 | Continue and save the new target. | The target is created using the ERP-sourced target type. The record appears in the Targets list. |
| 6 | Refresh the 'Targets' page and search for the new target by Article Number. | The created target remains visible with the same Article Number and mapped target-type values. |
| 7 | Close and reopen the 'Targets' page and reopen the created record. | The persisted target still shows ERP-mapped values and uses 'Article Number' terminology. |

## Expected Outcome
ERP-imported target types are available for selection and map exact ERP field values into target creation. The UI uses 'Article Number' terminology instead of 'BPS Number'. The created target persists after refresh and reopen with unchanged mapped values.
