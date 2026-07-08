# R10.2 Update for CR 286836 - Search for Installed Hardware Components: Verify search returns matching installed hardware components (Happy Path)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 287451
Requirement: Search for Installed Hardware Components

## Preconditions
- User is signed in with permissions to view/search installed hardware components.
- Installed hardware component data exists.
- Search/filter controls are available on the target page.
- At least one known installed component with unique searchable attributes is available.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open installed hardware components search page. | Search page and controls load successfully. |
| 2 | Enter valid search criteria matching known installed components and execute search. | Search executes successfully. |
| 3 | Review returned results. | Matching installed hardware components are shown and non-matching records are excluded. |
| 4 | Verify key fields in result rows (for example identifier, location, status). | Result row fields align with expected installed component data. |
| 5 | Open one returned record. | Record details match expected component data. |
| 6 | Navigate back to results. | Previous criteria and result set are preserved. |

## Expected Outcome
Search returns only correct matching installed hardware components for valid criteria, with accurate result data and stable navigation behavior.
