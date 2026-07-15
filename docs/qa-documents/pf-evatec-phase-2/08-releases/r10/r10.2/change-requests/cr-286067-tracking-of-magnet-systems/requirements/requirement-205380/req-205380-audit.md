# Requirement 205380 - Test Case Audit
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

Using your QA audit template and focusing on Remove Associations, with special attention to R10.2 magnet system-related impacts, here's the review.

Test Case ID	Coverage Status	Gaps/Issues	Recommended Improvements	Overlap NotesAttempt to Remove Learned Association with Limited Permissions	Yes	Expected result says "specified security result" which is unclear. Does not explicitly reference required permission.	Update expected result to state user cannot remove associations without the appropriate ManageHardware_Edit security right. Verify Remove controls are disabled or inaccessible.	Duplicate test appears twice in the provided set. Remove duplicate.
Remove Learned Association (Targets)	Partial	Covers removal and persistence after save. Does not verify impact on future candidate selection lists. Does not verify behavior after reload beyond simple visibility check.	Verify target association is removed from learned associations and no longer appears as a previously learned target type. Validate persistence across page reload and application restart if applicable.	Similar structure to Hardware Components removal test.
Remove Learned Association (Hardware Components)	Partial	Covers UI removal but not downstream impact. Does not verify association was removed from learned data source.	Add validation that removed hardware component no longer appears as a learned candidate for future association recommendations.	Significant overlap with R10.2 Happy Path.
R10.2 Remove Association: Verify tester can remove an existing hardware association (Happy Path)	Partial	Stronger than original R8 hardware removal test because it validates candidate list impact. However, it is hardware-focused and does not cover target or magnet system associations.	Keep candidate-list validation. Extend equivalent coverage to Target Types and Magnet System Types.	Overlaps with Hardware Components removal test. Could potentially replace it.
Requirement Coverage Assessment

From the requirements reviewed previously:

Hardware Components
Requirement Area	CoverageRemove hardware association	Covered
Save removal	Covered
Persist after refresh	Covered
Downstream candidate impact	Covered by R10.2
Target Types
Requirement Area	CoverageRemove target association	Covered
Save removal	Covered
Persist after refresh	Covered
Downstream candidate impact	Not Covered
Magnet System Types
Requirement Area	CoverageRemove magnet system association	Not Covered
Standard magnet system behavior after removal	Not Covered
Candidate list impact after removal	Not Covered
Persistence after refresh	Not Covered
Major Missing Test Case

The current suite contains no dedicated magnet system association removal test.

Recommended Test Case

Title: Remove Learned Association (Magnet System Types)

Step	Expected ResultVerify preconditions.	Role contains one or more learned magnet system associations.
Open Manage Hardware and navigate to Learned Associations.	Learned Associations are displayed.
Select a role with learned magnet system associations.	Associated magnet system types are displayed.
Remove one learned magnet system association.	Association is removed from the displayed list. Save button becomes enabled.
Save changes.	Changes are saved successfully.
Refresh the page.	Removed magnet system association is not displayed.
Navigate to the magnet system installation candidate list for the same role.	Removed magnet system type is no longer presented as a previously installed learned candidate.
Additional Missing Negative Test
Verify Last Magnet System Association Can Be Removed
Step	Expected ResultSelect a role with only one learned magnet system association.	One association is displayed.
Remove the association and save.	Association is removed successfully.
Refresh the page.	No magnet system associations are displayed for the role.
Overall Assessment
Area	Coverage StatusSecurity Permissions	Covered
Hardware Association Removal	Covered
Target Association Removal	Partially Covered
Magnet System Association Removal	Not Covered
Persistence After Save	Covered
Candidate List Impact	Partially Covered
Duplicate Test Detection	Duplicate limited-permission test exists
Recommendation

I would rate the current Remove Associations coverage as Partial (70-75%).

The largest gap is that magnet system association removal has zero direct coverage, despite R10.2 introducing significant magnet system association functionality. A dedicated magnet system removal test should be added before considering the requirement fully covered.
