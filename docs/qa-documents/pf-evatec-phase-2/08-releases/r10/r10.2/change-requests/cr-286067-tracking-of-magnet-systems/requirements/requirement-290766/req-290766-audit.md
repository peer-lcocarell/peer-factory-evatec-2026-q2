# Requirement 290766 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete — 2026-07-16

---

## Coverage Assessment

### Existing Test Cases

| File | Test Case ID | Coverage |
|------|-------------|----------|
| 001-view-and-upload-documents-for-new-magnet-system-happy-path.md | TC-290766-01 | Single document upload, post-save visibility |
| 002-upload-documents-invalid-file-type-negative.md | TC-290766-02 | Invalid file type rejection |
| 003-upload-multiple-documents-happy-path.md | TC-290766-03 | Multiple document upload, selective removal, no confirmation prompt |
| 004-remove-uploaded-document-before-save.md | TC-290766-04 | Single document removal, no confirmation prompt, post-save verification |

### Coverage Gaps (Resolved)

| Gap | Resolution |
|-----|-----------|
| Multiple document upload not validated | Covered in 003 |
| Selective removal from multiple documents not tested | Covered in 003 |
| Document removal not tested | Covered in 004 |
| Removal without confirmation not validated | Covered in 003 and 004 |

### Recommendations

- All acceptance criteria are now covered.
- Publish all 4 test cases to ADO suite for requirement 290766.

---

## Notes

Audit completed 2026-07-16. Two new test cases added (003, 004) to close gaps. TC-A/TC-D consolidated into 003. TC-B/TC-C consolidated into 004.
13.5.2.1REQUIREMENT: View and upload documents for new magnet system
A user will be able to upload one or more documents when creating a new magnet system.

The user can also view remove uploaded documents (no confirmation before removal).

QA Audit Test Cases Against Requirements
Requirements

Requirement ID: 290766
 Requirement: View and upload documents for new magnet system

Acceptance criteria identified from requirement:

User can upload one or more documents when creating a new Magnet System.
User can view uploaded documents.
User can remove uploaded documents.
Removal occurs without a confirmation prompt.
1. Coverage Audit Table
Test Case ID	Requirement ID(s)	Coverage Status (Yes/Partial/No)	Gaps/Issues	Recommended Improvements	Overlap NotesTC-290766-01 Happy Path Upload Document	290766	Partial	Verifies upload and post-save visibility of a single document only. Does not validate multiple document upload. Does not validate document removal. Does not validate removal without confirmation. Does not explicitly verify viewing documents during creation.	Add validation for multiple document upload. Add document removal scenarios. Verify document visibility before save. Verify removal behavior.	Minimal overlap with TC-290766-02. Both validate upload functionality but with different outcomes.
TC-290766-02 Invalid File Type Upload	290766	Partial	Validates unsupported file type handling, which is not explicitly required. Does not validate viewing documents. Does not validate document removal. Does not validate no-confirmation removal behavior. Does not validate multiple documents.	Retain as risk-based negative coverage. Add removal and visibility validation test cases.	Some overlap with TC-290766-01 during valid upload recovery step. Overlap is acceptable because the primary objective differs.
2. Uncovered Requirements

The following acceptance criteria are not sufficiently covered:

Requirement Area	Coverage Status	NotesUpload one or more documents	Partial	Existing test validates a single document only. Requirement explicitly states one or more documents.
View uploaded documents	Partial	Covered after save and reopen. Not explicitly covered during Magnet System creation.
Remove uploaded documents	No	No test case validates document removal.
Remove uploaded documents without confirmation	No	No test case verifies absence of a confirmation dialog.
Missing Test Coverage

TC-A: Upload Multiple Documents

Upload multiple valid documents during Magnet System creation.
Verify all uploaded documents are displayed.
Verify all documents remain associated after save.

TC-B: Remove Uploaded Document

Upload a document.
Remove the document before save.
Verify the document is no longer displayed.
Verify the document is not associated after save.

TC-C: Verify Removal Without Confirmation

Upload a document.
Remove the document.
Verify no confirmation dialog is displayed.
Verify immediate removal from the document list.

TC-D: Remove One Document From Multiple Uploaded Documents

Upload multiple documents.
Remove one document.
Verify only the selected document is removed.
Verify remaining documents remain associated after save.
3. Orphaned Test Cases

None identified.

All provided test cases map to Requirement 290766.

4. Summary Metrics
Metric	ValueTotal Requirements	1
Total Test Cases Reviewed	2
Fully Covered Requirements	0
Partially Covered Requirements	1
Uncovered Requirements	0
Missing Requirement Behaviors	2
Orphaned Test Cases	0
Redundant Test Cases	0
Audit Result

Requirement 290766 is only partially covered.

The current test suite adequately covers:

Basic document upload
Document persistence after save
Unsupported file type validation

The current test suite does not cover:

Multiple document upload
Document removal
Document removal without confirmation

Per the requirement wording, document removal functionality is a mandatory behavior and should be tested before the requirement can be considered fully covered.
