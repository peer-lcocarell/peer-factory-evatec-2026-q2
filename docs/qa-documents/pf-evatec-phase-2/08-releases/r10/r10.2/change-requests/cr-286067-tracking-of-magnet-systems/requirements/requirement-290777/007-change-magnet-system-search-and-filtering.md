# R10.2 Update for CR 286067 - Change Magnet System: Verify Magnet System search and filtering behavior in selection dialog (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System role slot (empty or installed).
- The role slot has a previously-installed Magnet System type on record.
- Keywords are configured for the role slot.
- Magnet Systems exist in `Checked Out` status with names matching and not matching the configured keywords.
- Magnet Systems exist in `In Stock`, `In Use`, `In Inspection`, and `Retired` status.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page and trigger the Install or Change Magnet System action. | The Magnet System selection dialog opens. |
| 2 | Review the initial list contents without entering a search term. | Only `Checked Out` Magnet Systems are shown. The list is pre-filtered to include Magnet Systems whose type was previously installed for this role. Magnet Systems matching the configured keywords are included. |
| 3 | Verify that Magnet Systems in `In Stock`, `In Use`, `In Inspection`, and `Retired` status are absent from the list. | None of the non-`Checked Out` Magnet Systems appear in the selection list. |
| 4 | Enter a full-text search term that matches a known `Checked Out` Magnet System. | The search results display matching `Checked Out` Magnet Systems. Results remain constrained by keyword filtering when keywords are configured. |
| 5 | Enter a search term that does not match any eligible Magnet System. | The selection list is empty or displays a no-results message. |
| 6 | Clear the search term. | The full pre-filtered list is restored. |

## Expected Outcome
The selection dialog shows only `Checked Out` Magnet Systems. The initial list is pre-filtered by previously-installed type and configured keywords. Full-text search works within the filtered results. Non-`Checked Out` Magnet Systems are excluded at all times regardless of search input.
