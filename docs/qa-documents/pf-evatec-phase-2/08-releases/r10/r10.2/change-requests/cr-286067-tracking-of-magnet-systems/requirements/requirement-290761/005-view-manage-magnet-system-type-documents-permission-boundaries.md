# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify permissions with document upload process

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents in Edit Magnet System Type

## Tags
- R10.2

## Preconditions
- A Magnet System Type record exists with at least one attached document.
- The tester can sign in with dedicated accounts for each permission profile.
- Permission profile A has MagnetSystemType_View only.
- Permission profile B has no MagnetSystemType_View and no MagnetSystemType_Edit.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in with permission profile A and open the target Magnet System Type record. | The tester can view document entries and can open or download allowed documents. Add, Replace, and Remove actions are not available. |
| 2 | Attempt direct navigation to Edit Magnet System Type with permission profile A. | Edit access is denied or redirected according to security rules. No edit document action is available. |
| 3 | Sign out and sign in with permission profile B. | Authentication succeeds for the account. |
| 4 | Attempt to open the target Magnet System Type record and access document actions. | Access to document viewing and edit actions is denied according to security rules. |
| 5 | Attempt direct URL navigation to Edit Magnet System Type with permission profile B. | Access is denied or redirected and no document data is exposed. |

## Expected Outcome
Document actions enforce permission boundaries. View-only users can read allowed documents but cannot change documents. Users without required rights cannot access document data or edit workflows.
