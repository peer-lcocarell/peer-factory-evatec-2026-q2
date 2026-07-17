# 286067 Magnet System Types - Edit Prototype Magnet System Type Read-Only Field Constraints

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` permissions.
- At least one Prototype Magnet System Type exists with known field values.
- The 'Magnet System Types' page is accessible from the application menu.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads and displays existing records including at least one Prototype. |
| 2 | Select a known Prototype Magnet System Type and open it in Edit mode. | The Edit page loads. Prototype-specific fields are displayed including Variant Code and Predecessor. |
| 3 | Verify ERP-sourced fields such as Article Number, Name, and ERP Status. | ERP-sourced fields are displayed as read-only and cannot be modified. |
| 4 | Verify the Variant Code field. | Variant Code is displayed in read-only format as `V##`. No input control is active. |
| 5 | Verify the Predecessor field. | Predecessor is displayed as read-only and contains the original article number. No input control is active. |
| 6 | Verify the Source Type field. | Source Type is displayed as read-only. No input control is active. |
| 7 | Verify the FlexiCat Type field. | FlexiCat Type is displayed as read-only. No input control is active. |
| 8 | Update an editable field such as Description with a new value and click Save. | Save completes without errors. The Description value is updated. All read-only fields remain unchanged. |
| 9 | Re-open the same Prototype record. | Updated Description persists. ERP-sourced read-only fields, Variant Code, Predecessor, Source Type, and FlexiCat Type are unchanged. |

## Expected Outcome
Prototype-specific read-only fields (Variant Code, Predecessor, Source Type, FlexiCat Type) and ERP-sourced read-only fields (Article Number, Name, ERP Status) cannot be modified in Edit mode. Editable fields such as Description can be saved successfully. Read-only constraints are enforced consistently and persist after save.
