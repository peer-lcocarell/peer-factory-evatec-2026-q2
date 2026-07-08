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
- At least one editable comment field and the `Deleted` toggle are visible for the selected ERP component.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Components and search for an existing ERP hardware component. | Matching component is displayed and can be selected. |
| 2 | Open the component in Edit mode and note baseline values for comment and `Deleted`. | Edit screen opens and baseline values are captured. |
| 3 | Update a valid editable comment field and toggle `Deleted` to a different valid state. | Field changes are accepted and Save is enabled. |
| 4 | Click Save. | Save succeeds without validation errors and success feedback is displayed. |
| 5 | Re-open the same component in Edit mode. | Updated comment and `Deleted` values are displayed correctly. |
| 6 | Open component from list/details view. | List/details reflect the saved values consistently. |

## Expected Outcome
Tester can update ERP hardware component comment and `Deleted` values with valid data, and saved changes persist consistently across Edit and list/detail views.
