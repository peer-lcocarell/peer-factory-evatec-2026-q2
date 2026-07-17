# Requirement 290777 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete — Suite consolidated to 11 test cases. Original 006/007/008 merged into 003/004/002. New tests added as 006 (Cancellation), 007 (Search and Filtering), 008 (Security).

---

## Coverage Assessment

### Existing Test Cases

- 001 — Replace Happy Path — basic replace flow, status transitions, HW config version. Missing: confirmation screen, optional comment, location format, old/new MS field validation, MS link in role slot.
- 002 — History Regression — HW config history, logbook, install/uninstall MS history. Good.
- 003 — No Eligible Replacement — empty selection list. Good.
- 004 — Install into Empty Slot — install from empty slot, status, history. Good.
- 005 — Uninstall — uninstall flow, status, history, logbook. Good.
- 006 — Not Checked Out Negative — In Stock excluded from list. Good.
- 007 — Logbook on Install — logbook entry detail. Good.
- 008 — Logbook Filter — Magnet System filter category. Good.

### Coverage Gaps

**Missing from 001:**
- Confirmation screen not validated — requirement requires confirm/cancel prompt with optional comment.
- Optional comment field (max 250 characters) not tested.
- Old Magnet System post-change: Location cleared, status `Checked Out`, `uninstalled` history entry not validated.
- New Magnet System post-change: Location format (`[Tool]`, `[Tool], [Module]`, `[Module]` undocked) not validated.
- Role slot `MS####` link to Magnet System details not validated.

**Missing entirely:**
- Cancel from selection screen — no change, no history, no logbook.
- Cancel from confirmation screen — no change, no history, no logbook.
- List pre-filtering by previously-installed type and keyword logic.
- Full-text search behavior within the selection dialog.
- `change` vs `install` logbook entry distinction not explicitly tested.
- Security: `HardwareConfiguration_Edit` enforced — not tested.

### Recommendations

- **Update 001** — Add confirmation screen validation, optional comment, old MS field validation (status, location, history), new MS field validation (status, location, history), MS link in role slot.
- **Create 006** — Cancellation: cancel from selection and confirmation screens, verify no changes to config, status, history, or logbook.
- **Create 007** — Search and Filtering: pre-filtered list by type, keyword filtering, full-text search, status exclusions.
- **Create 008** — Security: `HardwareConfiguration_Edit` enforced for authorized and unauthorized users.

---

## Coverage Matrix

| Requirement Clause | Test Case | Status |
|---|---|---|
| Only Checked Out in selection list | 001, 006 | Covered |
| Pre-filter by previously-installed type | 007 | Covered |
| Keyword filtering | 007 | Covered |
| Full-text search | 007 | Covered |
| Uninstall-only option when installed | 005 | Covered |
| Cancel from selection screen | 006 | Covered |
| Cancel from confirmation screen | 006 | Covered |
| Confirmation screen shown | 001 | Gap — update needed |
| Optional comment (max 250 chars) | 001 | Gap — update needed |
| Old MS: status Checked Out, location cleared | 001 | Gap — update needed |
| Old MS: uninstalled history entry | 001, 002 | Partial |
| Uninstall logbook entry | 005 | Covered |
| New MS: status In Use | 001, 004 | Covered |
| New MS: location set (Tool/Module format) | 001 | Gap — update needed |
| New MS: installed history entry | 004, 007 | Covered |
| Change logbook entry (replace) | 002 | Covered |
| Install logbook entry (new) | 007 | Covered |
| MS#### link in HW config role slot | 001 | Gap — update needed |
| HW config version increments | 001, 004, 005 | Covered |
| HW config history entry | 002 | Covered |
| Logbook Magnet System filter | 008 | Covered |
| No eligible Checked Out MS | 003 | Covered |
| Security: HardwareConfiguration_Edit | 008 | Covered |

---

## Notes

Audit date: 2026-07-16.

13.6.4REQUIREMENT: Change Magnet System
Magnet systems are special hardware components that are tracked within PF that have additional restrictions on when they can be installed.

When the user starts the magnet system change they will be prompted to select the magnet system to install. The list will only contain those that are in the ‘Checked Out’ status and initially will contain

Magnet systems that have a type previously installed for this role (at any tool)

If keywords are configured for the role then magnet systems that have a name/source type/flexicat type/comment containing any of the keywords

The user can perform a full text search for checked out magnet systems. If there are keywords the search will be filtered by the keywords first.

If a magnet system is currently installed the user will have the option just to Uninstall. Otherwise the user will select a magnet system to continue (Next). Either way the user can also cancel without making any changes.

When the user chooses to continue with an installation they will be prompted to confirm the change and can enter an optional comment (maximum 250 characters). Again the user can cancel without making any changes.

Upon ‘Uninstall’ or confirmation with a current magnet system PF will

1.Clear the old magnet systems’ location and set its status to ‘Checked Out’

2.Add an ‘uninstalled’ entry to the old magnet systems’ history

3.For ‘Uninstall’

a.Add the ‘uninstalled’ entry to the logbook

b.The role will be cleared in the latest hardware configuration

Upon confirmation PF will

1.Set the new magnet systems’ location to

a.“[Tool Name]” if there is no module, or

b.“[Tool Name], [Module Name]” for non-dockable or docked modules, or

c.“[Module Name]” for an undocked module

2.Set the new magnet systems’ status to ‘In Use’

3.Add a ‘installed’ entry to the new magnet systems’ history

4.If there is an “old magnet system” add a ‘change’ entry to the logbook, otherwise add an ‘install’ entry to the logbook

5.The role will display the magnet system (MS####) with a link to the magnet system details in the latest hardware configuration

Users must have the HardwareConfiguration_Edit security right to change magnet systems.
‎
Based on the test cases you already have, I would not create 5 new tests as originally recommended. You already cover much of the requirement. I'd keep the suite lean and focus on a few gaps.

Keep Existing Tests
Change Magnet System: Replace Installed Magnet System (Happy Path)
Change Magnet System: Hardware Configuration History Reflects Change (Regression)
Change Magnet System: Install Magnet System Into Empty Role Slot (Happy Path)
Change Magnet System: Uninstall Magnet System (Happy Path)
Change Magnet System: No Eligible Replacement Exists (Negative)
Change Magnet System: Attempt to Install Magnet System Not in Checked Out Status (Negative)
Logbook Entry Generated During Install (Integration)
Magnet System Logbook Filter (Integration)
Update Existing Test
Update: Replace Installed Magnet System

Add coverage for:

Confirmation Screen
Step	Action	Expected ResultX	Proceed after selecting a replacement Magnet System.	A confirmation screen is displayed. An optional Comment field is available with a maximum length of 250 characters. The tester can Confirm or Cancel.
Old Magnet System Validation
Step	Action	Expected ResultX	Open the previously installed Magnet System record.	The status is Checked Out. The Location field is empty. An Uninstall history entry is present.
New Magnet System Validation
Step	Action	Expected ResultX	Open the newly installed Magnet System record.	The status is In Use. The Location field reflects the Tool and Module location. An Install history entry is present.
Hardware Configuration Validation
Step	Action	Expected ResultX	Review the role assignment within Hardware Configuration.	The Magnet System identifier (MS####) is displayed and provides a link to the Magnet System details.
Create New Test 1
Title
R10.2 Update for CR 286067 - Change Magnet System: Verify tester can cancel Change Magnet System without modifying Hardware Configuration (Negative)

Why Needed

The requirement contains two cancellation paths:

Cancel on selection screen
Cancel on confirmation screen

Neither is currently covered.

Cover
Cancel from selection dialog.
Cancel from confirmation dialog.
Verify:
No configuration changes.
No status changes.
No history entries.
No logbook entries.
Create New Test 2
Title
R10.2 Update for CR 286067 - Change Magnet System: Verify Magnet System search and filtering behavior (Validation)

Why Needed

The requirement contains significant list-filtering logic not currently covered.

Cover
Only Checked Out Magnet Systems appear.
Previously-installed Magnet System types are shown.
Keyword filtering is applied when configured.
Full-text search functions correctly.
Search results remain constrained by keyword filtering.
In Use, In Stock, In Inspection, and Retired Magnet Systems are excluded.
Create New Test 3
Title
R10.2 Update for CR 286067 - Change Magnet System: Verify HardwareConfiguration_Edit security permissions are enforced (Security)

Why Needed

Requirement explicitly states:

Users must have the HardwareConfiguration_Edit security right to change magnet systems.

Cover
Authorized user can access Change Magnet System.
Unauthorized user cannot access Change Magnet System.
Direct access attempts are blocked.
No Additional Tests Needed

Do not create separate tests for:

Installed history entries
Uninstalled history entries
Logbook change entries
Magnet System hyperlinks
Location formatting
Status transitions

Those should be absorbed into the existing replacement, install, uninstall, and regression tests.

Final Suite (8 Test Cases)

| # | File | Type |
|---|------|------|
| 001 | 001-change-magnet-system-happy-path.md | Happy Path |
| 002 | 002-change-magnet-system-history-regression.md | Regression |
| 003 | 003-change-magnet-system-no-eligible-replacement-negative.md | Negative |
| 004 | 004-install-magnet-system-happy-path.md | Happy Path |
| 005 | 005-uninstall-magnet-system-happy-path.md | Happy Path |
| 006 | 006-change-magnet-system-cancellation.md | Negative |
| 007 | 007-change-magnet-system-search-and-filtering.md | Validation |
| 008 | 008-change-magnet-system-security-permissions.md | Security |

Coverage Health: Good
Release Recommendation: Additional Coverage Recommended before signoff.
