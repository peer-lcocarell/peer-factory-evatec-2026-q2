# Requirement 174279 - Test Case Audit
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

Requirement Audit Summary
Requirement Information

Requirement ID: R9.1

Requirement Title: Change Automatic Input from BPS Name / Verify Updates to "New Target Type" Dialog

Audit Date: 2026-07-10

Executive Assessment

Assessment: Insufficient Coverage

The R10.2 test cases primarily validate ERP Target Type functionality, ERP imports, duplicate handling, and Magnet System Type restrictions.

The R9.1 requirement is focused on validating changes to the New Target Type dialog, including:

Name generation rules
Source Type behavior
Size field formatting
Clamp Thickness behavior
Safety Thickness defaults
Nominal TL defaults

The supplied R10.2 tests do not validate most of these requirements.

Overall Test Quality
Test structure is generally acceptable.
Positive and negative ERP workflows are covered.
Test cases are traceable to ERP import functionality.
Test cases are not traceable to most R9.1 requirements.
Requirement Coverage
Partially Covered

Confidence Level
Low

Release Readiness
Requires Additional Testing

Requirement Coverage Matrix
Requirement Statement	Coverage Status	Test Cases Covering Requirement	NotesName generated as "Material D+Size Tx By"	Missing	None	No validation of Name format
Name excludes "Target" text	Missing	None	Not covered
Name excludes Source information	Missing	None	Not covered
Name excludes Purity information	Missing	None	Not covered
Source Type has no default value	Missing	None	Not covered
Source Type selectable from predefined values	Missing	None	Not covered
Size field contains no units	Missing	None	Not covered
Size field does not display inch values	Missing	None	Not covered
No inch input used for Size	Missing	None	Not covered
Clamp Thickness has no default value	Missing	None	Not covered
Clamp Thickness uses predefined values	Missing	None	Not covered
Safety Thickness defaults to 1 when Material Thickness <=13	Missing	None	Not covered
Safety Thickness defaults to 2 when Material Thickness >13	Missing	None	Not covered
Nominal TL defaults to 99.9	Missing	None	Not covered
BPS Number replaced with Article Number	Partial	ERP Selection Happy Path	Article Number appears but replacement of BPS# is not explicitly verified
ERP-imported Target Type available for selection	Full	ERP Selection Happy Path	Covered but not part of original R9.1 requirement
Duplicate ERP imports handled appropriately	Full	Duplicate Import Validation	Covered but not part of original R9.1 requirement
Article assigned as Magnet System Type cannot be reused	Full	Magnet System Type Negative	Covered but not part of original R9.1 requirement
Existing Test Case Assessment
Test Case ID	Coverage Status	Strengths	Gaps / Issues	Recommended ImprovementsR10.2 Verify Target Type Imported from ERP is Available for Selection	Partial	Validates ERP article selection and target creation	Does not validate New Target Type dialog behavior	Add validation for all R9.1 field rules
R10.2 Verify Duplicate Target Type Records Are Handled Correctly During Import	Not Applicable to R9.1	Good duplicate handling coverage	Does not validate any R9.1 dialog requirements	Trace to ERP import requirement rather than R9.1
R10.2 Attempt to Create Target Type Using Article Assigned as Magnet System Type	Not Applicable to R9.1	Good negative business-rule coverage	Does not validate any dialog field changes	Trace to Magnet System business rule requirement
Missing Requirement Coverage
Name generation format

Removal of Target keyword from Name

Removal of Source information from Name

Removal of Purity information from Name

Source Type default value behavior

Source Type predefined selection list

Size field formatting

Size field unit removal

Inch value removal

Clamp Thickness default behavior

Clamp Thickness predefined value behavior

Safety Thickness rule for <=13

Safety Thickness rule for >13

Nominal TL default value

Explicit BPS Number replacement validation

Missing Test Scenarios
Verify Target Name Format Generation

Requirement Covered

Name generation rule

Reason Needed

Core requirement of R9.1.
No existing validation.

Suggested Validation

Create a new Target Type.
Verify generated Name follows:
Material D+Size Tx By
Verify Target, Source, and Purity values are not included.
Verify Source Type Default Behavior

Requirement Covered

Source Type requirements

Reason Needed

Requirement explicitly changes existing behavior.

Suggested Validation

Open New Target Type dialog.
Verify Source Type is blank.
Verify predefined selections are available.
Verify Size Field Formatting

Requirement Covered

Size formatting requirements

Reason Needed

Requirement explicitly changes displayed values.

Suggested Validation

Verify no mm suffix displayed.
Verify inch values are not displayed or entered.
Verify Clamp Thickness Configuration

Requirement Covered

Clamp Thickness requirements

Reason Needed

No current coverage.

Suggested Validation

Verify no default value exists.
Verify predefined values are available.
Verify Safety Thickness Defaults

Requirement Covered

Safety Thickness rule

Reason Needed

Business rule currently untested.

Suggested Validation

Material Thickness = 13

Verify Safety Thickness = 1

Material Thickness = 14

Verify Safety Thickness = 2

Verify Nominal TL Default

Requirement Covered

Nominal TL requirement

Reason Needed

Core requirement currently untested.

Suggested Validation

Create New Target Type.
Verify Nominal TL defaults to 99.9.
Verify Article Number Replaces BPS Number

Requirement Covered

R10.1 requirement

Reason Needed

Only indirectly referenced.

Suggested Validation

Open all Target Type dialogs.
Verify Article Number displayed.
Verify BPS# is not displayed anywhere.
Regression Risk Assessment
High Risk
Name generation logic
Source Type default behavior
Safety Thickness calculations
Nominal TL default value
BPS Number to Article Number conversion
Medium Risk
Target creation workflow
ERP field mapping
Dropdown configuration values
Low Risk
Dialog navigation
Basic ERP article selection
Security Coverage Assessment
Covered
Magnet System Type article restriction
Missing
Permission validation for Target Type creation
Permission validation for ERP article selection
Permission validation for ERP import operations
Role-based access control validation
Persistence Coverage Assessment
Covered
Target creation and record appearance in list
Missing
Refresh validation

Close/Reopen validation

Persistence after save

Persistence after application restart

Persistence after ERP re-import

Test Quality Findings
Actions Review

The following action appears in multiple tests:

Verify preconditions.


Issue:

Not a tester action.
Should be moved into Preconditions.

Additional concern:

Review the summary output.


This is vague and does not define a specific tester action.

Expected Results Review

The following expected result is weak:

The summary indicates how the duplicate was handled (updated, skipped, or flagged per business rules).


Issue:

Multiple acceptable outcomes.
Test does not define expected behavior.

The following expected result is weak:

The record reflects the outcome defined by business rules.


Issue:

Not directly observable without knowing the expected rule.

The following expected result needs stronger validation:

Target type fields populate from ERP data.


Issue:

Does not specify exact fields or values.
Recommended Test Case Updates
High Priority
Add dedicated validation for every R9.1 field change.
Explicitly verify Name generation logic.
Verify Safety Thickness business rules.
Verify Nominal TL default of 99.9.
Verify Source Type behavior.
Verify Clamp Thickness behavior.
Explicitly verify BPS# replacement with Article Number.
Medium Priority
Add refresh persistence validation.
Add close/reopen validation.
Add ERP field mapping verification.
Low Priority
Replace generic expected results with specific observable outcomes.
Remove generic "Verify preconditions" execution steps.
Recommended New Test Cases
Verify New Target Type Dialog Name Generation

Purpose

Validate Name formatting changes.

Requirement Covered

Name generation requirements

Priority

High
Verify Source Type Field Configuration

Purpose

Validate Source Type default and selection behavior.

Requirement Covered

Source Type requirements

Priority

High
Verify Size Field Formatting Rules

Purpose

Validate unit removal and inch restrictions.

Requirement Covered

Size field requirements

Priority

High
Verify Clamp Thickness Configuration

Purpose

Validate Clamp Thickness requirements.

Requirement Covered

Clamp Thickness requirements

Priority

High
Verify Safety Thickness Calculation Logic

Purpose

Validate automatic Safety Thickness defaults.

Requirement Covered

Safety Thickness requirements

Priority

High
Verify Nominal TL Default Value

Purpose

Validate Nominal TL default behavior.

Requirement Covered

Nominal TL requirement

Priority

High
Verify Article Number Replaces BPS Number

Purpose

Validate R10.1 terminology update.

Requirement Covered

Article Number replacement

Priority

Medium
Final Assessment
Coverage Rating
15%

Confidence Level
Low

Release Readiness
Requires Additional Testing

QA Recommendation

The supplied R10.2 test suite does not adequately validate the R9.1 New Target Type dialog requirements. Nearly all R9.1 business rules related to field defaults, formatting, calculations, and automatic naming remain untested. The current tests are focused on ERP-driven Target Type workflows and have limited traceability to the actual R9.1 requirement. Additional targeted test cases are required before R9.1 can be considered sufficiently validated.
