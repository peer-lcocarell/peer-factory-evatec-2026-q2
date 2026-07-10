# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify hardware components are imported successfully using the default file format

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 264374
- Requirement: Import Hardware Components from File

## Preconditions
- Tester is signed in with `ERP_View` and `ERP_Edit` security rights.
- A valid Report File import file is available.
- The file contains:
  - New hardware component records.
  - Existing hardware component records for update.
  - Records matching configured Product Group filters.
  - ERP-derived Magnet System Type records.
- Hardware Components Import page is accessible.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Navigate to the Hardware Components Import page. | The Hardware Components Import page is displayed. |
| 2 | Review the selected file format. | The Report File format is selected by default. |
| 3 | Select a valid import file. | The file is accepted for import. |
| 4 | Start the import. | The import begins without validation errors. |
| 5 | Wait for the import to complete. | The import completes successfully. |
| 6 | Review the import summary. | The summary displays the number of records Added, Updated, and Skipped. |
| 7 | Search for a newly added hardware component from the import file. | The hardware component is displayed. |
| 8 | Review the imported field values. | Article #, Name, Name (English), Product Group, Manufacturer, ERP Status, and Successor values match the source file mappings. |
| 9 | Search for an existing hardware component included in the import file. | The hardware component is displayed. |
| 10 | Review the updated field values. | The updated values match the source file data. |
| 11 | Review records from the import file that do not match configured Product Group filters. | Records that do not match configured Product Group filters are not imported. |
| 12 | Review an ERP-derived Magnet System Type associated with an imported hardware component. | The Magnet System Type Name, Name (English), and Status values are updated based on the imported data. |

## Expected Outcome
- The Report File format is selected by default.
- Hardware components are imported successfully.
- Only records matching configured Product Group filters are imported.
- Hardware component fields are mapped correctly from the source file.
- ERP-derived Magnet System Types are updated with imported values.
- The import summary displays accurate Added, Updated, and Skipped counts.
