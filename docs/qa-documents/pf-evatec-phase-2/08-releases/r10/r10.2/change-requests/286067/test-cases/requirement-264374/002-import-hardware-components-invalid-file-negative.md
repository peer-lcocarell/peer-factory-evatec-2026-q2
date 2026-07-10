# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify error message is displayed for an invalid import file

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 264374
- Requirement: Import Hardware Components from File

## Preconditions
- Tester is signed in with `ERP_View` and `ERP_Edit` security rights.
- An invalid import file is available with an unsupported format or invalid structure.
- Existing Hardware Component data is present for comparison.
- Hardware Components Import page is accessible.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Navigate to the Hardware Components Import page. | The Hardware Components Import page is displayed. |
| 2 | Select the invalid import file. | The file is selected for import. |
| 3 | Start the import. | The import does not complete successfully. |
| 4 | Review the displayed validation message. | An error message identifies the file as invalid and indicates the reason for the failure. |
| 5 | Review any import summary information that is displayed. | No records are reported as added or updated. |
| 6 | Navigate to Hardware Components and review existing records. | Existing Hardware Component records remain unchanged. No unintended additions, updates, or deletions are present. |

## Expected Outcome
- Invalid import files are not imported.
- A validation message is displayed describing the import failure.
- Existing Hardware Component data is not modified.
- No Hardware Components are added or updated from the invalid file.
