# R10.2 Update for CR 286067 - Magnet System Type History: Verify history records prototype lineage from Standard through Prototype creation and promotion (Audit)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290762
Requirement: Magnet System Type History (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Standard Magnet System Type exists with a known source Article Number.
- A source Magnet System identifier is available for prototype creation.
- The Magnet System Type History view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Standard Magnet System Type and navigate to its History view. | The History view loads. A creation history entry is present and its summary includes the Standard Article Number. |
| 2 | Create a Prototype from the Standard type using source Magnet System `MS0001` and a unique Article Number. | The Prototype Magnet System Type is created with variant code `V01`. |
| 3 | Open the Prototype Magnet System Type History view. | A creation history entry is present for the Prototype. The entry includes timestamp, user, and summary text that references source Standard Article Number and modified Magnet System `MS0001`. |
| 4 | Edit the Prototype Magnet System Type such as updating Description and save. | Save completes successfully. |
| 5 | Review Prototype History after save. | A new edit history entry is present with timestamp, user, and short summary of the edit. |
| 6 | Promote the Prototype to Standard using the `Define as Standard` action. | Promotion completes successfully. |
| 7 | Open History for the now Standard Magnet System Type. | A promotion entry is present with timestamp, user, and summary. The full trail Create Standard -> Create Prototype V01 -> Edit -> Promote to Standard is visible in chronological order. |
| 8 | Open History for the original source Standard type used to create the prototype. | The original Standard type history remains unchanged by prototype promotion and still shows its own creation lineage correctly. |

## Expected Outcome
The Magnet System Type History view shows complete lineage across create, prototype create, edit, and promote events. Standard and prototype creation summaries include required identifiers such as Article Number and modified Magnet System. Each entry includes timestamp, user, and short summary. The history of a promoted type remains complete. Promotion traceability includes predecessor prototype context while preserving original source Standard history integrity.
