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

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing ERP hardware component in Edit mode. | Edit screen opens successfully. |
| 2 | Clear one or more required fields. | Required fields become empty. |
| 3 | Click Save. | Save is blocked and required-field validation messages are displayed. |
| 4 | Enter valid values in the required fields and save again. | Validation clears and save succeeds. |

## Expected Outcome
System prevents saving when required fields are blank and displays clear validation feedback.
