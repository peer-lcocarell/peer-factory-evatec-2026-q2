Area Path	Iteration Path	 ID	Title	QA Writing Est	QA Testing Est	Focus Priority (1-4)	Comments	Link
PFEvatec\WF06 (Logbook)\Magnet Systems	Phase 2\R10\R10.2	286067	Ticket #35008 - Tracking of magnet systems in Evatec Fabric	3.00	10.00	1	"Impacts:
- 32 requirements.
QA Writing Approach:
- Test case writing with assistance from Copilot for formating to expadite. Happy path, unhappy path scenarios planned with some edge cases and regressions around modified requirements. 
QA Testing Approach:
- QA will verify....
- QA will validate ...
- QA will confirm...
- QA will verify ...
- QA will perform regression testing on impacted requirements....

Potential Issues:
- Very important. Crux of release."	Change Request 286067: Ticket #35008 - Tracking of magnet systems in Evatec Fabric
PFEvatec\WF06 (Logbook)\HW Config	Phase 2\R10\R10.2	285729	Ticket #34951 - Search HW components	0.25	1.00	2	"Impacts:
- 3 requirements.
QA Writing Approach:
- Test case writing with assistance from Copilot for formating to expadite. Happy path, unhappy path scenarios planned with some edge cases and regressions around modified requirements. 
QA Testing Approach:
- QA will verify Search HW components works across all listed areas by executing positive and negative searches, validating installed hardware results, and confirming consistent filtering and result display behavior on each page.
Potential Issues:
- Differences in page-level data loading, indexing, or caching could lead to inconsistent search behavior across the impacted areas."	Change Request 285729: Ticket #34951 - Search HW components
PFEvatec	Phase 2\R10\R10.2	286836	Ticket #34948 - Article import	0.50	1.00	3	"Impacts:
- 2 requirements.
QA Writing Approach:
- Test cases will be created with Copilot assistance to expadite formatting and writing process, covering happy path, unhappy path, edge cases, and regression scenarios for impacted functionality.
QA Testing Approach:
- QA will verify custom import formats and mappings.
- QA will validate hardware component imports using legacy and new file formats.
- QA will confirm field mappings and numeric status values import correctly.
- QA will verify partial imports do not incorrectly deactivate valid hardware components.
- QA will perform regression testing on BOM Import, Work Order Import, and Hardware Component import workflows.
Potential Issues:
- Incorrect mappings may result in invalid imported data.
- Import framework changes could affect existing import workflows.
- Partial imports may incorrectly deactivate hardware components.
- Large import files may expose performance issues."	Change Request 286836: Ticket #34948 - Article import
PFEvatec\WF02 (Box and Substrates)\Box Management	Phase 2\R10\R10.2	284111	Ticket #34682 - WBS Element for self-service boxes	0.25	0.50	4	"Impacts:
- 2 requirements
QA Writing Approach:
- Test case writing with assistance from Copilot for formating to expadite. Happy path, unhappy path scenarios planned with some edge cases and regressions around modified requirements. 
QA Testing Approach:
- QA will verify the new WBS Element field works across all listed pages by creating and editing self-service boxes, confirming the value saves correctly, displays consistently, and remains available in related workflows.
Potential Issues:
- Differences in how each page loads or caches data could lead to inconsistent WBS Element behavior.

"	Change Request 284111: Ticket #34682 - WBS Element for self-service boxes
PFEvatec	Phase 2\R10\R10.2	290161	Ticket #35623 - Error: Use PDT to create the tool definition for new tool type	0.00	0.00	N/A	"Impacts:
- 0 requirements.
Note:
- This item was logged as a CR because it introduces support for a new tool type rather than fixing an existing defect.
- The change was delivered as a customer patch to unblock Hermann's tool setup activity.
- Hermann validated the fix in his environment and closed the ticket.
- No additional internal QA testing is planned.
"	Change Request 290161: Ticket #35623 - Error: Use PDT to create the tool definition for new tool type
			Ad Hoc Verification Time:	0.00	3.00		Because the changes impact many areas of the application, verify that ad hoc testing is performed for all affected components in each CR.	
			Total Est Time:	4.00	15.50			
