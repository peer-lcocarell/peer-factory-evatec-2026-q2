# R10.2 Update for CR 286067 - Magnet Systems: Verify selected Magnet System actions are controlled by status and security rights (Authorization)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User A has `MagnetSystems_View` only.
- User B has `MagnetSystems_View`, `MagnetSystems_Create`, `MagnetSystems_Edit`, `MagnetSystems_Modify`, `MagnetSystems_Process`, and `MagnetSystems_Remove`.
- One active Prototype Magnet System exists.
- One active non-Prototype Magnet System exists.
- One checked out Magnet System exists.
- One retired Magnet System exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as User A and open the 'Magnet Systems' page. Select an active record and open available actions. | User can view details only. Create, Edit, Modify, Define as Standard, Checkout, Return, and Retire actions are hidden or blocked without required rights. |
| 2 | Sign out and sign in as User B. Open the 'Magnet Systems' page. | New Magnet System action is available for User B because `MagnetSystems_Create` is present. |
| 3 | Click Magnet System Number for a selected row. | Details view opens as the default action. |
| 4 | Open action menu on an active non-Prototype record. | Print Label, Edit, Modify, and Checkout are available when rights are present. Define as Standard is not available because the record is not Prototype. |
| 5 | Open action menu on an active Prototype record. | Define as Standard is available for Prototype record and `MagnetSystems_Modify` right. |
| 6 | Open action menu on a checked out record. | Return action is available with `MagnetSystems_Process` right. |
| 7 | Open action menu on an active record eligible for retirement. | Retire action is available with `MagnetSystems_Remove` right. |
| 8 | Open action menu on a retired record. | Record is view-only. Measure or retire actions are not available for retired records. |

## Expected Outcome
Selected Magnet System actions are exposed only when both status and permission prerequisites are met. Details view is the default click action. Action availability for create, print label, edit, modify, define as standard, checkout, return, and retire follows the requirement rules.
