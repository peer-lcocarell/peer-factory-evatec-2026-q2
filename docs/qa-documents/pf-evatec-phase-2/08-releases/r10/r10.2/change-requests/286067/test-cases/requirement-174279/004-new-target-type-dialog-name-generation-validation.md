# R10.2 Update for CR 286067 - New Target Type from ERP: Verify New Target Type dialog field rules, defaults, and naming

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 174279
Requirement: New Target Type from ERP (New Target Type)

## Preconditions
- User is signed in with `Targets_View` and `Targets_Edit` permissions.
- New Target Type dialog is accessible.
- Test data exists to populate Material, Diameter, Thickness, and By values.
- Predefined Source Type and Clamp Thickness values are documented.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the New Target Type dialog. | The dialog is displayed and editable. |
| 2 | Observe Source Type and Clamp Thickness before any selection. | Source Type and Clamp Thickness have no default value. |
| 3 | Open Source Type and Clamp Thickness selection lists. | Only predefined values are available in both lists. |
| 4 | Review Size field formatting and attempt inch-style input. | Size field is displayed without unit suffixes and inch representation is not used. |
| 5 | Enter values required for generated name components (Material, D+Size, Tx, By). | Name field is generated from input values. |
| 6 | Review generated Name value and exclusions. | Name format matches `Material D+Size Tx By` and does not include `Target`, Source information, or Purity information. |
| 7 | Set Material Thickness to `13` and observe Safety Thickness. | Safety Thickness defaults to `1`. |
| 8 | Set Material Thickness to `14` and observe Safety Thickness. | Safety Thickness defaults to `2`. |
| 9 | Observe Nominal TL before user edit. | Nominal TL defaults to `99.9`. |
| 10 | Review identifiers and terminology in the dialog. | `Article Number` is displayed and `BPS Number` is not displayed. |
| 11 | Save and reopen the created target type. | Name, selected Source Type/Clamp Thickness, Safety Thickness behavior, Nominal TL default, and `Article Number` terminology persist as expected. |

## Expected Outcome
The New Target Type dialog enforces required naming, field defaults, dropdown constraints, terminology, and calculation rules in one end-to-end flow. Values persist correctly after save and reopen.
