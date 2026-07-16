# Requirement 290776 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete — Coverage sufficient. No new test cases required.

---

## Coverage Assessment

### Existing Test Cases

- 001 — Print Label: Happy Path — print action triggered, label generated without errors.
- 002 — Print Label: Content Validation — Magnet System #, Serial No., QR code content, variant code presence/absence.
- 003 — Print Label: Prototype Variant Code — Standard label has no variant code, Prototype label shows variant code, QR encodes Magnet System Number.

### Coverage Gaps

- Article #, Article Name, Comment, Source Type, FlexiCat Type, and Applications label fields not explicitly validated. Optional enhancement to 002.
- "Print at any time" (no status restriction) is implied but not explicitly tested across varied statuses. Low risk.
- 002 and 003 overlap on variant code and QR code validation. Overlap is acceptable given distinct test intent.
- Label physical dimensions (3" x 2") are out of scope for software testing.

### Recommendations

- No new test cases required.
- Optional: expand 002 to validate Article #, Article Name, Source Type, FlexiCat Type, and Applications.
- Optional: add one step to 001 confirming Print Label is available on Magnet Systems in varied statuses (e.g., `In Use`, `Retired`).

---

## Notes

Audit date: 2026-07-16.

Note: This audit file previously contained embedded test case content for requirement 290775 (Return Magnet System). That content has been removed from this file.
13.5.10REQUIREMENT: Print Magnet System Label
The user will be able to print the magnet system label at any time. A dialog will display a preview of the label and allow the user to print to a 3” x 2” label.

Sample label

A white background with black text  AI-generated content may be incorrect.

The QR code will contain the magnet system number.

The Variant Code will only be included if the magnet system is a prototype.
Here's the text visible in the image:

Magnet System #    MS0001

Serial No.         2034976_S001

Article #          102275490

Article Name       MF 300 DD magnetic system P

Variant Code

Comment

Source Type        ARQ151

FlexiCat Type      Linear

Applications       Ti HiPIMS, Al longlife


Logo text:

evatec
process systems


There is also a QR code on the right side of the label.


# R10.2 Update for CR 286067 - Return Magnet System: Verify tester can cancel a return operation (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `Checked Out` exists.
- The Magnet System has a known Location value.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select a Magnet System with status `Checked Out`. | The Magnet System record is selected. The Return action is available. |
| 2 | Trigger the 'Return' action. | The Return confirmation dialog is displayed. |
| 3 | Select Cancel. | The confirmation dialog closes. The return operation is not performed. |
| 4 | Re-open the Magnet System record. | The Magnet System status remains `Checked Out`. |
| 5 | Review the Location field and checkout information. | The Location value remains unchanged. The Checked Out By field remains unchanged. The Checked Out Timestamp remains unchanged. |
| 6 | Open the Magnet System History view. | No new Return history entry has been added. |

## Expected Outcome
The Return confirmation dialog allows the tester to cancel the operation. When Cancel is selected, no changes are made to the Magnet System. The status remains `Checked Out`, checkout information remains unchanged, the Location remains unchanged, and no Return history entry is created.


And the second new test you need:

# R10.2 Update for CR 286067 - Return Magnet System: Verify return security permissions are enforced (Security)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User account A has `MagnetSystems_Process` permission.
- User account B does not have `MagnetSystems_Process` permission.
- At least one Magnet System with status `Checked Out` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in using User Account A and open a Magnet System with status `Checked Out`. | The Return action is available. |
| 2 | Sign out and sign in using User Account B. Open the same Magnet System. | The Magnet System record is displayed. |
| 3 | Review available actions. | The Return action is not available. |
| 4 | Attempt to access the Return functionality through any available navigation path. | Access is denied or the functionality remains unavailable. The return operation cannot be performed. |

## Expected Outcome
Only users with the `MagnetSystems_Process` security right can access and execute the Return operation. Users without the required permission cannot access or perform the Return functionality.


Update 1: Return Happy Path

File:
 R10.2 Update for CR 286067 - Return Magnet System: Verify tester can return a Magnet System to available inventory (Happy Path)

Add the following steps after the current Step 4:

Step	Action	Expected Result5	Review the checkout information on the Magnet System record.	The Checked Out By field is empty. The Checked Out Timestamp field is empty.
6	Verify the Location field.	The Location field is empty.
7	Open the Magnet System History view.	A "Returned By" history entry is present containing the acting user and timestamp.
Updated Expected Outcome
A Checked Out Magnet System can be returned to inventory. After return, the status changes to In Stock, the Location field is cleared, the Checked Out By field is cleared, and the Checked Out Timestamp field is cleared. A Return history entry is written containing the acting user and timestamp.

Update 2: Return Invalid Status

File:
 R10.2 Update for CR 286067 - Return Magnet System: Attempt to return a Magnet System that is already In Stock (Negative)

Updated Preconditions

Add:

- At least one Magnet System with status In Inspection exists.
- At least one Magnet System with status Checked Out exists.

Replace Steps With
Step	Action	Expected Result1	Open the 'Magnet Systems' page and locate a Magnet System with status In Stock.	The Magnet System is displayed in the list with status In Stock.
2	Select the In Stock Magnet System and review available actions.	The Return action is not available.
3	Locate a Magnet System with status Checked Out.	The Magnet System is displayed in the list.
4	Review available actions.	The Return action is available.
5	Locate a Magnet System with status In Inspection.	The Magnet System is displayed in the list.
6	Review available actions.	The Return action is available.
Updated Expected Outcome
The Return action is available only for Magnet Systems in Checked Out or In Inspection status. Magnet Systems already in In Stock status do not allow the Return action.

Delete This Test Case

Remove:

R10.2 Update for CR 286067 - Return Magnet System: Verify Location is cleared and status returns to In Stock after return from Checked Out (Validation)


Reason:

This coverage is more appropriately included in the Return Happy Path test and does not represent a separate workflow.
