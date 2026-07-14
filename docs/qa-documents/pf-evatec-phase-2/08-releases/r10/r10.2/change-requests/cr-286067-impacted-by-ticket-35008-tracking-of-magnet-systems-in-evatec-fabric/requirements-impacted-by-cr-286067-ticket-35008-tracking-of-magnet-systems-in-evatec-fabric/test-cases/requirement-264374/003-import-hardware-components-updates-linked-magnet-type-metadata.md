# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify import updates linked Magnet System Type metadata from ERP-derived hardware component data

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 264374
- Requirement: Import Hardware Components from File

## Preconditions
- Tester is signed in with `ERP_View`, `ERP_Edit`, and `MagnetSystemType_View` security rights.
- A Magnet System Type exists that was created from an ERP Hardware Component.
- The linked Hardware Component exists in the import file.
- The import file contains updated values for the linked ERP Hardware Component.
- The import file includes valid Product Group values that match configured Product Group filters.
- Hardware Components Import page is accessible.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the linked Magnet System Type. | The Magnet System Type details are displayed. |
| 2 | Record the current Name, Name (English), and Status values. | Baseline values are captured for comparison. |
| 3 | Navigate to the Hardware Components Import page. | The Hardware Components Import page is displayed. |
| 4 | Select the updated import file. | The file is accepted for import. |
| 5 | Start the import. | The import begins without validation errors. |
| 6 | Wait for the import to complete. | The import completes successfully. |
| 7 | Review the import summary. | The summary indicates that one or more Hardware Component records were updated. |
| 8 | Open the Hardware Component associated with the Magnet System Type. | The Hardware Component displays the updated import values. |
| 9 | Reopen the linked Magnet System Type. | The Magnet System Type details are displayed. |
| 10 | Review the Name, Name (English), and Status fields. | The values match the updated ERP-derived Hardware Component data from the import file. |
| 11 | Review fields not sourced from ERP data. | User-maintained values remain unchanged. |

## Expected Outcome
- Updated ERP Hardware Component data is imported successfully.
- The linked Magnet System Type receives updated Name, Name (English), and Status values from the imported ERP data.
- The import summary reports the Hardware Component record as updated.
- Fields not maintained by ERP data remain unchanged.
