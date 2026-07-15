# Requirement 226384 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Pending

---

## Coverage Assessment

### Existing Test Cases

_To be completed._

### Coverage Gaps

_To be completed._

### Recommendations

_To be completed._

---

## Notes

_To be completed._

---

Using your audit format and focusing on 13.7.2 Requirement Coverage, these three test cases do not fully cover the requirement, especially for the Magnet System functionality introduced in R10.2.

Test Case ID	Coverage Status	Gaps/Issues	Recommended Improvements	Overlap NotesHardware Configuration for an Active Real Module	Partial	Only validates feature presence. Does not validate functionality. Missing "Change Magnet System" entirely. Export validation is weak because it does not actually open the exported file and verify Tool Name is omitted.	Add functional validation for each listed capability. Add explicit verification that Change Magnet System is available for active modules. Export file should be generated and inspected.	High-level inventory test.
Hardware Configuration for a Retired Module	Partial	Only validates controls are absent. Does not validate that functionality is blocked. Missing Change Magnet System validation.	Verify Change Magnet System is unavailable for retired modules. Verify edit actions cannot be triggered through UI.	Complementary to active module test.
R10.2 Verify Hardware Configuration is Displayed for a Real Module	Partial	Primarily a page-load test. Only verifies Magnet System role visibility. Does not verify Change Magnet System functionality. Does not validate any of the additional features listed in the requirement.	Add Change Magnet System workflow validation or create dedicated test cases. Add validation for export, rewind, and target workflows.	Some overlap with Active Real Module test.
Requirement Coverage Breakdown
Requirement	CoverageRewind	Partial
Export	Partial
Export excludes Tool Name	No
Change Hardware Component	Partial
Display Hardware Kit	Partial
Change Hardware Kit	Partial
Change Hardware Components Independent of Kit	Partial
Change Role Value	Partial
Change Module Label	Partial
Change Target if Docked	Partial
Change Target Offline if Undocked	Partial
Change Magnet System	No
Import Hardware Configuration	Partial
Retired Module Restrictions	Partial
Most Obvious Missing Coverage

The requirement explicitly states:

Change Magnet System

None of the existing tests verify:

Change Magnet System action exists for active real modules
A magnet system can be selected
The change can be saved
The change persists after refresh
The action is unavailable for retired modules
Recommended R10.2 Test Case

Title: Hardware Configuration for Real Module: Change Magnet System

Step	Expected ResultVerify preconditions.	Real module contains a Magnet System role.
Open Module Hardware Configuration.	Configuration page loads.
Select Change Magnet System.	Magnet System selection dialog is displayed.
Select a valid Standard Magnet System.	Selection is accepted.
Save changes.	Configuration is updated successfully.
Refresh the page.	Updated Magnet System remains assigned to the role.
Recommended Negative Test

Title: Hardware Configuration for Retired Module: Change Magnet System

Step	Expected ResultVerify preconditions.	Module is retired.
Open Module Hardware Configuration.	Configuration page loads.
Attempt to change Magnet System.	Change Magnet System functionality is unavailable.
Overall Assessment

Coverage Status: Partial (~35-40%)

For CR 286067 specifically, there is a clear gap around Magnet System functionality. The current tests only prove that a Magnet System role can be displayed. They do not prove that the required Change Magnet System capability actually works or that retired module restrictions are enforced.
