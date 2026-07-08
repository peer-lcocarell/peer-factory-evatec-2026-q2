# R10.2 Update for CR 286836 - Edit ERP Hardware Component: Verify validation is displayed when required fields are blank (Negative)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 75372
Requirement: Edit ERP hardware component (Hardware Components)

## Preconditions
- User is signed in with permissions to view and edit Hardware Components.
- At least one active ERP hardware component exists.
- Required fields and validation messages are enabled in the environment.
- User can restore valid values for all required fields after validation appears.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing ERP hardware component in Edit mode. | Edit screen opens successfully. |
| 2 | Clear one or more required fields. | Required fields become empty. |
| 3 | Click Save. | Save is blocked and required-field validation messages are displayed on each missing field. |
| 4 | Verify no record changes were committed after blocked save. | Baseline values remain unchanged in persisted record data. |
| 5 | Enter valid values in the required fields and save again. | Validation clears and save succeeds. |
| 6 | Re-open the same component. | Corrected required-field values are persisted and visible. |

## Expected Outcome
System prevents saving when required fields are blank, displays clear field-level validation, and allows save only after valid values are restored.
