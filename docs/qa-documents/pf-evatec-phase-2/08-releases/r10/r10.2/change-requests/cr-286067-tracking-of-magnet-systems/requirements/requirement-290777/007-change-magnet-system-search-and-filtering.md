---
TestCaseId: 293928
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify Magnet System search and filtering behavior in selection dialog

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

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page and trigger the Install or Change Magnet System action. | The Magnet System selection dialog opens. |
| 2 | Review the initial list without entering a search term. | Only `Checked Out` Magnet Systems are shown. The list is pre-filtered to the previously installed type for the role and includes configured keyword matches. Non-`Checked Out` statuses are not shown. |
| 3 | Enter a full-text search term that matches a known eligible Magnet System. | Matching `Checked Out` Magnet Systems are shown and results remain constrained by keyword filtering when keywords are configured. |
| 4 | Enter a full-text search term that does not match any eligible Magnet System. | The list shows no result and displays an empty state or no-results message. |
| 5 | Clear the search term, close the dialog, and open it again. | The full pre-filtered list is restored and remains consistent after reopening the dialog. |

## Expected Outcome
The selection dialog shows only `Checked Out` Magnet Systems. The initial list is pre-filtered by previously-installed type and configured keywords. Full-text search works within the filtered results. Non-`Checked Out` Magnet Systems are excluded at all times regardless of search input.
