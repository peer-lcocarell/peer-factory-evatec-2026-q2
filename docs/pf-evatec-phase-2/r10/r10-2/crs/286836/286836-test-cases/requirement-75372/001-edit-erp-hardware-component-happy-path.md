# R10.2 Update for CR 286836 - Edit ERP Hardware Component: Verify tester can update hardware component details with valid data (Happy Path)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 75372
Requirement: Edit ERP hardware component (Hardware Components)

## Preconditions
- User is signed in with permissions to view and edit Hardware Components.
- At least one active ERP-imported hardware component exists.
- Hardware Components page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Components and search for an existing ERP hardware component. | Matching component is displayed and can be selected. |
| 2 | Open the component in Edit mode. | Edit screen opens and editable fields are available. |
| 3 | Update valid editable fields and save. | Save succeeds without validation errors. |
| 4 | Re-open the same component. | Updated values are displayed correctly. |

## Expected Outcome
Tester can update ERP hardware component details with valid data, and saved values persist correctly.
