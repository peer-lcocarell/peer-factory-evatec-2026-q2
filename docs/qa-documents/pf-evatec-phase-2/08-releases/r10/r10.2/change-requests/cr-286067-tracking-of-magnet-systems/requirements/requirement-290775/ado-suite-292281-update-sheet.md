# ADO Update Sheet - Plan 291616 Suite 292281
## Requirement 290775 - Return Magnet System (Magnet Systems)

## Publish Commands

Dry-run validation:

```powershell
./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 `
   -Path "./docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/cr-286067-tracking-of-magnet-systems/requirements/requirement-290775" `
   -Filter "0*.md" `
   -PlanId 291616 `
   -SuiteId 292281 `
   -ContinueOnError `
   -WhatIf
```

Live publish:

```powershell
./scripts/ado/invoke-ado-suite-publish-from-folder.ps1 `
   -Path "./docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/cr-286067-tracking-of-magnet-systems/requirements/requirement-290775" `
   -Filter "0*.md" `
   -PlanId 291616 `
   -SuiteId 292281 `
   -ContinueOnError
```

## Suite Cleanup

- Keep existing: R10.2 Update for CR 286067 - Return Magnet System: Verify tester can return a Magnet System to available inventory (Happy Path)
- Keep existing: R10.2 Update for CR 286067 - Return Magnet System: Attempt to return a Magnet System that is already In Stock (Unhappy Path)
- Remove duplicate: R10.2 Update for CR 286067 - Return Magnet System: Verify Location is cleared and status returns to In Stock after return from Checked Out

## Add New Test Case 1

Title:
R10.2 Update for CR 286067 - Return Magnet System: Cancel return keeps Magnet System in Checked Out state (Negative)

Area Path:
PFEvatec\Phase 2\R10\R10.2

Tags:
R10.2; Regression

Preconditions:
- User is signed in with MagnetSystem_View and MagnetSystem_Edit permissions.
- At least one Magnet System with status Checked Out exists with a known Location value.
- The selected Magnet System has Checked Out By and Checked Out Timestamp populated.
- The Magnet Systems list is accessible.

Steps and Expected Results:
1. Action: Open the Magnet Systems list and select a Magnet System with status Checked Out.
   Expected: The record is selected. The Return action is available.
2. Action: Trigger the Return action.
   Expected: The Return confirmation dialog is displayed with Confirm and Cancel options.
3. Action: Select Cancel in the Return confirmation dialog.
   Expected: The dialog closes. No return is executed.
4. Action: Re-open the Magnet System record.
   Expected: The Magnet System status is still Checked Out. The Location field still contains the original value. Checked Out By is unchanged. Checked Out Timestamp is unchanged.
5. Action: Open the Magnet System History view.
   Expected: No new Return history entry is created for this action.

## Add New Test Case 2

Title:
R10.2 Update for CR 286067 - Return Magnet System: User without process permission cannot return Magnet System (Authorization)

Area Path:
PFEvatec\Phase 2\R10\R10.2

Tags:
R10.2; Regression

Preconditions:
- Test user A is signed in with MagnetSystem_View and MagnetSystem_Edit permissions but without MagnetSystems_Process permission.
- Test user B is signed in with MagnetSystem_View, MagnetSystem_Edit, and MagnetSystems_Process permissions.
- At least one Magnet System with status Checked Out exists.
- The Magnet Systems list is accessible.

Steps and Expected Results:
1. Action: Sign in as test user A and open the Magnet Systems list.
   Expected: The list loads and records are visible.
2. Action: Select a Magnet System with status Checked Out and review available actions.
   Expected: The Return action is not available to test user A.
3. Action: Attempt direct navigation to return functionality for the same Checked Out Magnet System as test user A.
   Expected: Access is denied. No return change is persisted. No Return history entry is created.
4. Action: Sign out and sign in as test user B. Select the same Checked Out Magnet System and review actions.
   Expected: The Return action is available to test user B.
5. Action: Trigger and confirm Return as test user B. Re-open the Magnet System record.
   Expected: The return completes. Status is In Stock. Location is empty. Checked Out By is empty. Checked Out Timestamp is empty. A Return history entry is present with test user B and timestamp.

## Post-Update Expected Suite State

- Total test cases in suite: 4
- Unique scenarios in suite: 4
- Duplicate location-cleared standalone case: removed
- Coverage additions: Cancel behavior and permission boundary

## Execution Status

- Executed on 2026-07-20
- Live publish completed
- Duplicate cleanup completed

Final suite test case IDs:

- 293159 - Happy Path
- 293160 - In Stock Unhappy Path
- 293998 - Cancel return keeps Checked Out
- 293999 - Permission boundary
