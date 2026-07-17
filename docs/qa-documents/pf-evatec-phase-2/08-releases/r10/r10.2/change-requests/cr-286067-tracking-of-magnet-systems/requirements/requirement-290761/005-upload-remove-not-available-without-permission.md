# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify upload and remove actions are not available without edit permission (Security)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290761
Requirement: View and manage magnet system type documents

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_View` only.
- A Magnet System Type exists with at least one document attached.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and navigate to the documents section. | Documents are listed. Upload and Remove actions are hidden or disabled. |
| 2 | Attempt direct URL navigation to the document upload endpoint if the route is known. | Access is denied. No document is uploaded. |

## Expected Outcome

Users without edit permission can view documents but cannot upload or remove. Direct upload access is denied.
