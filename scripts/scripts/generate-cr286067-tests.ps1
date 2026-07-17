Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$base = "c:\repos\pf-evatec\peer-factory-evatec-2026-q2\docs\qa-documents\pf-evatec-phase-2\08-releases\r10\r10.2\change-requests\cr-286067-tracking-of-magnet-systems\requirements"

$files = @{

    "requirement-290757\004-applications-field-multiple-selections.md"                        = @'
# R10.2 Update for CR 286067 - New Magnet System Type: Verify the Applications field supports multiple selections including predefined and custom values (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- Predefined Application values exist in the system.
- A valid ERP article is available for Magnet System Type creation.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System Type' form and select a valid ERP article. | Form opens with an Applications field visible. |
| 2 | Click the Applications field. | A dropdown or picker opens showing predefined Application values. |
| 3 | Select two predefined Application values. | Both values are shown as selected in the field. |
| 4 | Enter a custom Application value not in the predefined list. | Custom value is accepted and added to the selection. |
| 5 | Save the Magnet System Type. | Type is created. Applications field on the detail page displays all three selected values as a comma-separated list. |
'@

    "requirement-290757\005-erp-article-used-as-target-type-excluded.md"                      = @'
# R10.2 Update for CR 286067 - New Magnet System Type: Verify an ERP article already used as a Target Type is excluded from Magnet System Type creation (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- An ERP article exists that is already used as a Target Type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System Type' form and open the ERP article selection. | Article picker opens. |
| 2 | Search for the article already used as a Target Type. | The article does not appear in the selection list or is marked as unavailable. |
| 3 | Attempt to type the article number directly if the field supports free text. | A validation error is displayed stating the article is already in use as a Target Type. Save is blocked. |
'@

    "requirement-290757\006-erp-article-used-as-magnet-system-type-excluded.md"               = @'
# R10.2 Update for CR 286067 - New Magnet System Type: Verify an ERP article already used as a Magnet System Type cannot be used to create a duplicate type (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- An ERP article exists that is already used as a Magnet System Type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System Type' form and open the ERP article selection. | Article picker opens. |
| 2 | Search for the article already used as a Magnet System Type. | The article does not appear in the selection list or is marked as unavailable. |
| 3 | Attempt to type the article number directly if the field supports free text. | A validation error is displayed stating the article is already in use. Save is blocked. |
'@

    "requirement-290756\003-list-not-accessible-without-view-permission.md"                   = @'
# R10.2 Update for CR 286067 - Magnet System Types: Verify the Magnet System Types list is not accessible without view permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in without `MagnetSystemType_View`.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Attempt to navigate to the 'Magnet System Types' list page. | Access is denied. The list page does not load. |
| 2 | Attempt direct URL navigation to a Magnet System Type detail page. | Access is denied. Detail page does not load. |
'@

    "requirement-290756\004-create-new-magnet-system-type-from-list.md"                       = @'
# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can create a new Magnet System Type from the list page (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A valid ERP article is available that is not yet used as a Target Type or Magnet System Type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list page. | List page is displayed. A 'New' or 'Create' action is visible. |
| 2 | Click the create action. | New Magnet System Type form opens. |
| 3 | Select a valid ERP article and complete required fields. | Fields are populated. |
| 4 | Save the form. | New Magnet System Type appears in the list with Standard status. |
'@

    "requirement-290756\005-edit-magnet-system-type-from-list.md"                             = @'
# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can navigate to edit a Magnet System Type from the list page (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists in Standard status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list page. | List is displayed with the existing Standard type. |
| 2 | Open the Magnet System Type detail page and click 'Edit'. | Edit form opens. |
| 3 | Modify the Comment field and save. | Save completes. Updated value is visible on the detail page. |
'@

    "requirement-290756\006-promote-prototype-to-standard-from-list.md"                       = @'
# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can promote a Prototype Magnet System Type to Standard from the list page (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290756
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Prototype Magnet System Type (V01) exists with a linked Hardware Component available for promotion.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list page and locate the V01 prototype. | Prototype is listed with Prototype indicator and variant code V01. |
| 2 | Open the prototype detail page and start the 'Define as Standard' action. | Promotion dialog opens. |
| 3 | Link the valid Hardware Component and confirm. | Type is promoted to Standard. Prototype indicator and variant code are removed. |
| 4 | Refresh the 'Magnet System Types' list. | Type appears in the list with Standard status. |
'@

    "requirement-290762\003-prototype-creation-history-source-and-variant.md"                 = @'
# R10.2 Update for CR 286067 - Magnet System Type History: Verify prototype creation history records the source type and variant code (Audit)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290762
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit` and `MagnetSystemType_View`.
- A Standard Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Create a V01 prototype from the Standard type with a unique article number. | Prototype is created with variant code V01. |
| 2 | Open the V01 prototype Magnet System Type history. | A creation history entry exists showing source Standard type name, variant code V01, timestamp, and actor. |
| 3 | Create a V02 prototype from the same Standard type. | V02 prototype is created. |
| 4 | Open the V02 prototype history. | A creation history entry exists showing source Standard type name, variant code V02, timestamp, and actor. Entries for V01 and V02 are distinct. |
'@

    "requirement-290762\004-promotion-history-predecessor-prototype.md"                       = @'
# R10.2 Update for CR 286067 - Magnet System Type History: Verify promotion history records the predecessor prototype and links to the promoted type (Audit)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290762
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit` and `MagnetSystemType_View`.
- A V01 Prototype Magnet System Type exists.
- A valid Hardware Component is available for linking during promotion.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Promote the V01 prototype to Standard by linking a Hardware Component. | Promotion completes. Type is now Standard. |
| 2 | Open the promoted Magnet System Type history. | A promotion history entry exists showing predecessor V01 prototype reference, timestamp, and actor. |
| 3 | Verify the original Standard type history. | History reflects the initial creation entry and is not altered by the prototype promotion. |
'@

    "requirement-290763\003-create-prototype-from-standard-type.md"                           = @'
# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify tester can create a prototype from a Standard Magnet System Type (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290763
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Standard Magnet System Type exists with no existing prototypes.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Standard Magnet System Type detail page. | Type is displayed with Standard indicator. |
| 2 | Start the create prototype action. | Prototype creation dialog opens with a field for a unique article number. |
| 3 | Enter a unique article number that does not match any existing Hardware Component article number. | Article number is accepted with no validation error. |
| 4 | Confirm prototype creation. | A new Prototype Magnet System Type is created with variant code V01 and the entered article number. The originating Standard type is linked as the predecessor. |
| 5 | Open the Magnet System Type history for the new prototype. | History entry shows prototype creation with source Standard type, variant code V01, timestamp, and actor. |
'@

    "requirement-290763\004-variant-code-increments-to-v02.md"                                = @'
# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify variant code increments to V02 when a second prototype is created from the same source (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290763
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Standard Magnet System Type exists.
- A V01 prototype already exists for that Standard type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Standard Magnet System Type detail page and start the create prototype action again. | Prototype creation dialog opens. |
| 2 | Enter a unique article number different from the V01 article number. | Article number is accepted. |
| 3 | Confirm prototype creation. | A new Prototype Magnet System Type is created with variant code V02. The V01 prototype and V02 prototype are both visible and distinct. |
| 4 | Open Magnet System Type history for the V02 prototype. | History entry shows source as the Standard type, variant code V02, timestamp, and actor. |
'@

    "requirement-290763\005-magnet-systems-remain-linked-after-prototype-promotion.md"        = @'
# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify existing magnet systems remain linked to the promoted type after a prototype is promoted to Standard (Integration)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290763
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit` and `MagnetSystem_View`.
- A Prototype Magnet System Type (V01) exists.
- Two magnet systems are linked to the V01 prototype type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the V01 prototype type and start the 'Define as Standard' action. | Promotion confirmation dialog opens. |
| 2 | Link a valid Hardware Component to the prototype as part of the promotion. Confirm. | Prototype type is promoted to Standard. Type indicator changes from Prototype to Standard. |
| 3 | Open each of the two magnet systems that were linked to V01. | Both magnet systems remain linked to the promoted type. No change to their serial numbers or MS numbers. |
| 4 | Open Magnet System Type history for the promoted type. | History entry shows promotion event with timestamp, actor, and predecessor prototype reference. |
'@

    "requirement-290763\006-prototype-article-number-rejected-matching-hardware-component.md" = @'
# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify prototype article number is rejected when it matches an existing Hardware Component article number (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290763
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Standard Magnet System Type exists.
- An existing Hardware Component article number is known.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Standard Magnet System Type detail page and start the create prototype action. | Prototype creation dialog opens. |
| 2 | Enter an article number that matches an existing Hardware Component article number. | A validation error is displayed stating the article number matches an existing Hardware Component. Confirm button is disabled. |
| 3 | Clear the field and enter an article number that matches an existing Magnet System Type external ID. | A validation error is displayed stating the article number is already in use. Confirm button is disabled. |
| 4 | Clear the field and enter a unique article number with no matches. | Validation error clears. Confirm button is enabled. |
'@

    "requirement-290760\004-erp-sourced-fields-readonly-on-prototype-edit.md"                 = @'
# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify ERP-sourced fields are read-only when editing a Prototype Magnet System Type (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290760
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Prototype Magnet System Type (V01) exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the V01 prototype Magnet System Type detail page and click 'Edit'. | Edit form opens. |
| 2 | Locate ERP-sourced fields such as article number, name, and ERP status. | ERP-sourced fields are read-only and cannot be modified. |
| 3 | Modify an editable field such as Comment or Applications. | Editable fields accept input. |
| 4 | Save the form. | Save completes. ERP-sourced field values remain unchanged. Edited fields reflect the new values. |
'@

    "requirement-290760\005-cancel-edit-does-not-persist-changes.md"                          = @'
# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify cancelling edit with unsaved changes does not persist modifications (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290760
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and click 'Edit'. | Edit form opens. |
| 2 | Modify the Comment field. | Comment field shows the new value. |
| 3 | Click 'Cancel' or navigate away without saving. | A confirmation prompt appears warning of unsaved changes. |
| 4 | Confirm cancellation. | Edit form closes. Detail page shows the original Comment value unchanged. |
'@

    "requirement-290760\006-back-button-returns-to-detail-page.md"                            = @'
# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify the back button from edit returns the tester to the Magnet System Type detail page (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290760
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and click 'Edit'. | Edit form opens. |
| 2 | Without making changes click 'Back' or the equivalent navigation control. | Tester is returned to the Magnet System Type detail page. No changes are saved. |
'@

    "requirement-290760\007-save-button-enabled-only-on-valid-change.md"                      = @'
# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify Save button is only enabled when a valid change has been made (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290760
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and click 'Edit'. | Edit form opens. |
| 2 | Without modifying any field locate the Save button. | Save button is disabled. |
| 3 | Modify the Comment field. | Save button becomes enabled. |
| 4 | Revert the Comment field to its original value. | Save button becomes disabled again. |
'@

    "requirement-290760\008-edit-action-not-available-without-permission.md"                  = @'
# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify the Edit action is not available without edit permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290760
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_View` only.
- A Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page. | Detail page is displayed. 'Edit' action is hidden or disabled. |
| 2 | Attempt direct URL navigation to the edit endpoint if the route is known. | Access is denied. No changes are persisted. |
'@

    "requirement-290761\003-remove-document-from-magnet-system-type.md"                       = @'
# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify tester can remove a document from a Magnet System Type in edit mode (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290761
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists with at least one document attached.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type detail page and navigate to the documents section. | Attached document is listed. |
| 2 | Start the remove action for the document and confirm. | Document is removed. Document list no longer shows the removed file. |
| 3 | Reload the detail page. | Removed document does not reappear. Document list reflects the removal. |
'@

    "requirement-290761\004-invalid-file-types-rejected-on-upload.md"                         = @'
# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify invalid file types are rejected on upload (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290761
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`.
- A Magnet System Type exists.
- A file with an unsupported file type is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type documents section and start an upload. | File picker opens. |
| 2 | Select a file with an unsupported file type. | A validation error is displayed stating the file type is not allowed. The file is not added to the document list. |
| 3 | Select a file with a supported file type. | File is accepted and appears in the pending upload list. |
'@

    "requirement-290761\005-upload-remove-not-available-without-permission.md"                = @'
# R10.2 Update for CR 286067 - View and Manage Magnet System Type Documents: Verify upload and remove actions are not available without edit permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290761
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
'@

    "requirement-290765\003-duplicate-serial-number-rejected.md"                              = @'
# R10.2 Update for CR 286067 - New Magnet System: Verify a magnet system cannot be created with a serial number already in use (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290765
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists with a known serial number.
- A valid Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System' form and select the available Magnet System Type. | Form opens with serial number field. |
| 2 | Enter the serial number already in use by the existing magnet system. | A validation error is displayed stating the serial number is already in use. Save is disabled. |
| 3 | Clear the serial number field and enter a unique serial number. | Validation error clears. Save becomes available. |
'@

    "requirement-290765\004-required-fields-enforced-on-new-magnet-system.md"                 = @'
# R10.2 Update for CR 286067 - New Magnet System: Verify required fields are enforced before a new magnet system can be saved (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290765
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A valid Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System' form. | Form is displayed with required fields visible. |
| 2 | Attempt to save the form with no fields filled. | Save is blocked. Required field indicators are shown on all mandatory fields. |
| 3 | Select a Magnet System Type but leave serial number empty. | Save remains blocked. Serial number field shows a required indicator. |
| 4 | Enter a unique serial number. | All required field indicators clear. Save becomes available. |
| 5 | Save the form. | Magnet System is created with an auto-generated immutable MS number and the entered serial number in In Stock status. |
'@

    "requirement-290767\003-location-field-displays-tool-name-in-use-only.md"                 = @'
# R10.2 Update for CR 286067 - View Magnet System: Verify location field displays tool name when In Use and is empty for all other statuses (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290767
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`.
- One magnet system exists in In Use status with a known tool name.
- One magnet system exists in In Stock status.
- One magnet system exists in In Inspection status.
- One magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Use magnet system detail page. | Location field displays the tool name where the magnet system is installed. |
| 2 | Open the In Stock magnet system detail page. | Location field is empty. |
| 3 | Open the In Inspection magnet system detail page. | Location field is empty. |
| 4 | Open the Retired magnet system detail page. | Location field is empty. |
'@

    "requirement-290767\004-inspection-required-notification-visible.md"                      = @'
# R10.2 Update for CR 286067 - View Magnet System: Verify inspection-required notification is visible on the detail page when the flag is set (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290767
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`.
- One magnet system exists with the inspection-required flag set.
- One magnet system exists without the inspection-required flag.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system with the inspection-required flag. | An inspection-required notification or indicator is visible on the detail page. |
| 2 | Open the magnet system without the inspection-required flag. | No inspection-required notification is visible. |
'@

    "requirement-290767\005-action-buttons-reflect-status-and-permissions.md"                 = @'
# R10.2 Update for CR 286067 - View Magnet System: Verify action buttons reflect permitted actions based on magnet system status and tester permissions (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290767
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester A is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- Tester B is signed in with `MagnetSystem_View` only.
- One magnet system in In Stock status and one in Retired status are available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | As Tester A open the In Stock magnet system detail page. | 'Check Out' and 'Retire' actions are visible and enabled. 'Return' is not present. |
| 2 | As Tester A open the Retired magnet system detail page. | No lifecycle action buttons are enabled. |
| 3 | As Tester B open the In Stock magnet system detail page. | No lifecycle action buttons are visible or are all disabled. |
'@

    "requirement-290769\003-serial-number-and-ms-number-immutable.md"                         = @'
# R10.2 Update for CR 286067 - Edit Magnet System: Verify Serial Number and Magnet System Number fields cannot be edited after creation (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290769
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists with a known serial number and MS number.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system detail page and click 'Edit'. | Edit form opens. |
| 2 | Locate the Serial Number field. | Serial Number field is read-only and cannot be modified. |
| 3 | Locate the Magnet System Number field. | Magnet System Number field is read-only and cannot be modified. |
| 4 | Modify an editable field such as Comment and save. | Save completes. Serial Number and Magnet System Number remain unchanged from their original values. |
'@

    "requirement-290769\004-only-comment-editable-on-retired.md"                              = @'
# R10.2 Update for CR 286067 - Edit Magnet System: Verify only the Comment field is editable on a Retired magnet system (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290769
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Retired magnet system detail page and click 'Edit'. | Edit form opens. |
| 2 | Attempt to modify fields other than Comment. | All fields except Comment are read-only. |
| 3 | Modify the Comment field and save. | Save completes. Updated Comment is persisted. All other fields remain unchanged. |
'@

    "requirement-290769\005-inspection-required-notification-visible-on-edit.md"              = @'
# R10.2 Update for CR 286067 - Edit Magnet System: Verify inspection-required notification is visible on edit for magnet systems requiring inspection (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290769
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists with the inspection-required flag set.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system detail page and click 'Edit'. | Edit form opens. An inspection-required notification is visible. |
| 2 | Edit the Comment field and save. | Save completes. Inspection-required notification remains present. No action is blocked by the inspection flag. |
'@

    "requirement-290770\003-upload-and-replace-document-on-magnet-system.md"                  = @'
# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify tester can upload and replace a document on an existing magnet system (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290770
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists with at least one document attached.
- A replacement file with a supported file type is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system detail page and navigate to the documents section. | Existing document is listed. |
| 2 | Start the replace action for the existing document and select the replacement file. | Replacement file is shown as pending. |
| 3 | Save the document change. | Replacement file replaces the original. Original file is no longer listed. New file is listed with updated metadata. |
| 4 | Reload the detail page. | Only the replacement file is visible. |
'@

    "requirement-290770\004-invalid-document-operations-blocked.md"                           = @'
# R10.2 Update for CR 286067 - View and Manage Magnet System Documents: Verify invalid document operations are blocked (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290770
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system exists.
- A file with an unsupported file type is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system documents section and start an upload. | File picker opens. |
| 2 | Select a file with an unsupported file type. | A validation error is displayed stating the file type is not allowed. File is not added. |
| 3 | Attempt to remove a document while no document exists. | Remove action is hidden or disabled. |
'@

    "requirement-290771\003-distinct-history-entries-per-lifecycle-event.md"                  = @'
# R10.2 Update for CR 286067 - Magnet System History: Verify distinct history entries are generated for each major lifecycle event (Audit)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290771
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`, `MagnetSystem_View`, `HardwareConfiguration_Edit`, `ManageHardware_Edit`, `Logbook_View`.
- A magnet system exists in In Stock status.
- A module with a Magnet System role is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Edit the magnet system comment field and save. | History contains an edit entry with timestamp and actor. |
| 2 | Check out the magnet system. | History contains a checkout entry with timestamp, actor, user, and tool. |
| 3 | Install the magnet system in the module via 'Hardware Configuration'. | History contains an install entry with timestamp, actor, module, and tool. |
| 4 | Uninstall the magnet system from the module. | History contains an uninstall entry with timestamp, actor, module, and tool. |
| 5 | Return the magnet system. | History contains a return entry with timestamp and actor. |
| 6 | Retire the magnet system with a reason. | History contains a retire entry with timestamp, actor, and retirement reason. |
| 7 | Review all history entries. | Each lifecycle event has a distinct separate entry. No events are merged or missing. Entries are in chronological order. |
'@

    "requirement-290771\004-history-records-type-change-on-modify.md"                         = @'
# R10.2 Update for CR 286067 - Magnet System History: Verify history records the type change when a magnet system is modified to a prototype (Audit)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290771
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`, `MagnetSystemType_Edit`, and `MagnetSystem_View`.
- A magnet system in In Stock status exists linked to a Standard type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Modify the magnet system to create a new V01 prototype type. | Modification completes. Magnet system is now linked to the V01 prototype. |
| 2 | Open the magnet system history. | A modification entry exists showing the type change from the Standard type to the V01 prototype type, with timestamp and actor. |
| 3 | Open the Magnet System Type history for the V01 prototype. | A creation entry exists showing the predecessor Standard type, variant code V01, timestamp, and actor. |
'@

    "requirement-290771\005-history-entries-full-details-and-navigation.md"                   = @'
# R10.2 Update for CR 286067 - Magnet System History: Verify history entries display full details and navigation links where applicable (Audit)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290771
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`, `HardwareConfiguration_View`, `Logbook_View`.
- A magnet system has history entries for install and checkout events.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system history and locate the install history entry. | Entry shows module name, tool name, timestamp, and actor. |
| 2 | Click the tool or module link in the install history entry if present. | Navigation opens the referenced tool or module record. |
| 3 | Locate the checkout history entry. | Entry shows checked-out user name, tool name, timestamp, and actor. |
| 4 | Locate the return history entry. | Entry shows timestamp and actor. No tool or user context appears on the return entry. |
'@

    "requirement-290772\003-retire-blocked-when-in-use.md"                                    = @'
# R10.2 Update for CR 286067 - Retire Magnet System: Verify retire is blocked when the magnet system is In Use (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290772
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Use status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Use magnet system detail page. | 'Retire' action is not present or is disabled. |
| 2 | Attempt direct URL navigation to the retire endpoint if the route is known. | Access is denied. No retirement change is persisted. No history entry is created. |
'@

    "requirement-290772\004-retirement-reason-mandatory.md"                                   = @'
# R10.2 Update for CR 286067 - Retire Magnet System: Verify a mandatory retirement reason is required before retirement can be confirmed (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290772
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Stock magnet system detail page and click 'Retire'. | Retirement dialog opens with a reason input field. Confirm button is disabled. |
| 2 | Attempt to confirm retirement without entering a reason. | Confirm button remains disabled. A validation indicator is shown on the reason field. |
| 3 | Enter a retirement reason. | Confirm button becomes enabled. |
| 4 | Confirm retirement. | Magnet system status changes to Retired. Retirement history entry includes the entered reason, timestamp, and actor. |
'@

    "requirement-290772\005-retire-action-not-available-without-permission.md"                = @'
# R10.2 Update for CR 286067 - Retire Magnet System: Verify retirement action is not available without edit permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290772
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View` only.
- Tester does not have `MagnetSystem_Edit`.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Stock magnet system detail page. | 'Retire' action is hidden or disabled. |
| 2 | Attempt direct URL navigation to the retire endpoint if the route is known. | Access is denied. No retirement change is persisted. |
'@

    "requirement-290773\003-modify-blocked-when-in-use.md"                                    = @'
# R10.2 Update for CR 286067 - Modify Magnet System: Verify modify is blocked when the magnet system is In Use (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290773
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Use status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Use magnet system detail page. | 'Modify' action is not present or is disabled. |
| 2 | Attempt direct URL navigation to the modify endpoint if the route is known. | Access is denied. No modification change is persisted. No history entry is created. |
'@

    "requirement-290773\004-variant-code-increments-on-second-prototype.md"                   = @'
# R10.2 Update for CR 286067 - Modify Magnet System: Verify variant code increments sequentially when a second prototype is created from the same source type (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290773
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystemType_Edit`.
- A Standard Magnet System Type exists.
- One prototype (V01) has already been created from the Standard type.
- A second magnet system in In Stock status exists using the Standard type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the second magnet system detail page and start the Modify action. | Modify dialog opens. |
| 2 | Enter a unique article number and enter modification details. Confirm. | A new Prototype Magnet System Type is created with variant code V02. The magnet system is now linked to the V02 prototype type. |
| 3 | Open the Magnet System Type history for the V02 prototype. | History entry shows prototype creation with source linked to the original Standard type and variant code V02. |
'@

    "requirement-290773\005-assign-to-existing-prototype-type-during-modify.md"               = @'
# R10.2 Update for CR 286067 - Modify Magnet System: Verify a magnet system can be assigned to an existing prototype type during modify (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290773
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystemType_View`.
- A Prototype Magnet System Type (V01) exists.
- A magnet system in In Stock status exists using the Standard type that is the source of V01.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Stock magnet system detail page and start the Modify action. | Modify dialog opens with an option to select an existing prototype type. |
| 2 | Select the existing V01 prototype type. | V01 type is shown as the selected prototype. No new variant is created. |
| 3 | Confirm the modification. | Magnet system is now linked to the V01 prototype type. No new prototype type is created. |
| 4 | Open magnet system history. | A modification history entry exists showing the type change from Standard to V01 prototype with timestamp and actor. |
'@

    "requirement-290773\006-cancel-modify-does-not-create-prototype.md"                       = @'
# R10.2 Update for CR 286067 - Modify Magnet System: Verify cancelling the modify action does not create a prototype type or change the magnet system (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290773
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A magnet system in In Stock status exists using a Standard type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the magnet system detail page and start the Modify action. | Modify dialog opens. |
| 2 | Enter a unique article number and enter modification details. | Fields are populated. |
| 3 | Cancel the modify dialog. | Dialog closes without saving. |
| 4 | Open the magnet system detail page. | Magnet system still references the original Standard type. No prototype type was created. |
| 5 | Open the Magnet System Type list and search for a type with the entered article number. | No new prototype type exists with the entered article number. |
'@

    "requirement-290773\007-modify-action-not-available-without-permission.md"                = @'
# R10.2 Update for CR 286067 - Modify Magnet System: Verify modify action is not available without edit permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290773
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View` only.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Stock magnet system detail page. | 'Modify' action is hidden or disabled. |
| 2 | Attempt direct URL navigation to the modify endpoint if the route is known. | Access is denied. No modification is persisted. |
'@

    "requirement-290775\003-return-blocked-when-in-stock.md"                                  = @'
# R10.2 Update for CR 286067 - Return Magnet System: Verify return is blocked when the magnet system is In Stock (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290775
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Stock magnet system detail page. | 'Return' action is not present or is disabled. |
| 2 | Attempt direct URL navigation to the return endpoint if the route is known. | Access is denied. No return change is persisted. No history entry is created. |
'@

    "requirement-290775\004-location-cleared-and-status-in-stock-after-return.md"             = @'
# R10.2 Update for CR 286067 - Return Magnet System: Verify location context is cleared and status is In Stock after a successful return (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290775
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in checked-out status with a recorded user and tool.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the checked-out magnet system detail page and click 'Return'. | Return confirmation dialog opens. |
| 2 | Confirm the return. | Magnet system status changes to In Stock. Location field is empty. Checked-out user and tool context is cleared. |
| 3 | Open the magnet system history. | A return history entry exists with timestamp and actor. No checked-out user or tool appears in the current detail. |
'@

    "requirement-290776\003-prototype-variant-code-on-label.md"                               = @'
# R10.2 Update for CR 286067 - Print Magnet System Label: Verify the prototype variant code appears on the label when the magnet system is linked to a prototype type (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290776
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`.
- A magnet system exists linked to a V01 Prototype Magnet System Type.
- A magnet system exists linked to a Standard Magnet System Type.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the prototype-linked magnet system detail page and open the print label preview. | Label preview is displayed. Variant code V01 is visible on the label. QR code is present. |
| 2 | Open the standard-linked magnet system detail page and open the print label preview. | Label preview is displayed. No variant code appears on the label. QR code is present. |
| 3 | Verify the QR code content on the prototype label. | QR code encodes the Magnet System number. |
'@

    "requirement-290777\003-install-checked-out-magnet-system-empty-slot.md"                  = @'
# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can install a checked-out magnet system into an empty role slot (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `HardwareConfiguration_Edit`, `ManageHardware_Edit`, and `MagnetSystem_View`.
- A module has a Magnet System role with no magnet system currently installed.
- A magnet system exists in checked-out status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the module 'Hardware Configuration' page. | Magnet System role row is visible with no installed magnet system. |
| 2 | Start the install action for the empty Magnet System role slot. | Candidate selection dialog opens showing available checked-out magnet systems. |
| 3 | Select the checked-out magnet system. | Selected magnet system name and serial number are shown in the dialog. |
| 4 | Confirm the install. | Module 'Hardware Configuration' page reflects the installed magnet system with name and serial number. |
| 5 | Open the magnet system history. | An install entry exists with timestamp, actor, module name, and tool name. |
| 6 | Open the tool logbook. | A Magnet System install entry exists with timestamp, actor, magnet system number, and serial number. |
'@

    "requirement-290777\004-uninstall-magnet-system-and-logbook-entry.md"                     = @'
# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can uninstall an installed magnet system and logbook and history entries are recorded (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `HardwareConfiguration_Edit`, `ManageHardware_Edit`, and `MagnetSystem_View`.
- A module has a Magnet System role with a magnet system currently installed.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the module 'Hardware Configuration' page. | Magnet System role row shows the installed magnet system name and serial number. |
| 2 | Start the uninstall action for the installed magnet system. | Uninstall confirmation dialog opens. |
| 3 | Confirm the uninstall. | Module 'Hardware Configuration' page shows the role slot as empty. |
| 4 | Open the magnet system history. | An uninstall entry exists with timestamp, actor, module name, and tool name. |
| 5 | Open the tool logbook. | A Magnet System uninstall entry exists with timestamp, actor, magnet system number, and serial number. |
'@

    "requirement-290777\005-install-blocked-when-not-checked-out.md"                          = @'
# R10.2 Update for CR 286067 - Change Magnet System: Verify install is blocked when the candidate magnet system is not checked out (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `HardwareConfiguration_Edit` and `ManageHardware_Edit`.
- A module has a Magnet System role with no magnet system installed.
- A magnet system exists in In Stock status and is not checked out.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the module 'Hardware Configuration' page. | Magnet System role slot is empty and install action is available. |
| 2 | Start the install action for the Magnet System role slot. | Candidate selection dialog opens. |
| 3 | Search for the In Stock non-checked-out magnet system. | The In Stock non-checked-out magnet system does not appear in the candidate list. |
| 4 | Attempt to confirm install with no eligible candidate selected. | Install is blocked. A validation message indicates no eligible checked-out magnet system is available. |
| 5 | Open the magnet system history and the tool logbook. | No install entry exists in either location. |
'@

    "requirement-290777\006-logbook-entry-generated-on-install.md"                            = @'
# R10.2 Update for CR 286067 - Change Magnet System: Verify a logbook entry is generated in the tool logbook when a magnet system is installed (Integration)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `HardwareConfiguration_Edit`, `ManageHardware_Edit`, and `Logbook_View`.
- A module has a Magnet System role with no magnet system installed.
- A checked-out magnet system is available.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Install the checked-out magnet system into the module Magnet System role slot. | Install completes. Module hardware configuration reflects the installed magnet system. |
| 2 | Open the tool logbook. | A Magnet System install entry is visible in the logbook. |
| 3 | Open the logbook entry details. | Entry contains magnet system number, serial number, actor, and timestamp. |
| 4 | Filter the logbook by the Magnet System category. | The install entry remains visible. Other category entries are filtered out. |
'@

    "requirement-290777\007-magnet-system-filter-category-in-logbook.md"                      = @'
# R10.2 Update for CR 286067 - Change Magnet System: Verify the Magnet System filter category is visible and functional in the tool logbook (Integration)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `Logbook_View`.
- A tool logbook exists with at least one Magnet System install or uninstall entry and at least one non-Magnet System entry.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the tool logbook. | Logbook entries are displayed including Magnet System entries and non-Magnet System entries. |
| 2 | Open the logbook filter panel. | A Magnet System filter category is visible in the filter options. |
| 3 | Select the Magnet System filter category. | Only Magnet System-related entries remain visible. All other entry types are hidden. |
| 4 | Clear the Magnet System filter. | All logbook entries are visible again. |
'@

    "requirement-290764\003-checkout-happy-path.md"                                           = @'
# R10.2 Update for CR 286067 - Magnet Systems: Verify tester can check out an In Stock magnet system and a checkout history entry is recorded (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290764
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- A magnet system exists in In Stock status.
- The magnet system is not installed in any tool.
- A valid user and tool are available for selection.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and locate the In Stock record. | Record is visible with status In Stock. |
| 2 | Open the magnet system detail page. | 'Check Out' action is visible and enabled. |
| 3 | Click 'Check Out'. | Checkout dialog opens with fields for user and tool. |
| 4 | Select a user and select a tool. | Selected user and tool names are displayed in the dialog. |
| 5 | Confirm the checkout. | Detail page reflects the checkout state. No error message is shown. |
| 6 | Open the magnet system history. | A checkout entry exists with timestamp, actor identity, selected user name, and selected tool name. |
'@

    "requirement-290764\004-checkout-blocked-invalid-status.md"                               = @'
# R10.2 Update for CR 286067 - Magnet Systems: Verify checkout is blocked for magnet systems not in In Stock status (Unhappy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290764
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- One magnet system exists in In Use status.
- One magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the In Use magnet system detail page. | 'Check Out' action is not present or is disabled. |
| 2 | Open the Retired magnet system detail page. | 'Check Out' action is not present or is disabled. |
| 3 | Open history for both records. | No new checkout history entry exists on either record. |
'@

    "requirement-290764\005-checkout-not-available-without-permission.md"                     = @'
# R10.2 Update for CR 286067 - Magnet Systems: Verify checkout action is not available without edit permission (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290764
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View` only.
- Tester does not have `MagnetSystem_Edit`.
- A magnet system exists in In Stock status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | List is visible. In Stock record is visible. |
| 2 | Open the In Stock magnet system detail page. | 'Check Out' action is hidden or disabled. No checkout can be initiated. |
| 3 | Attempt direct URL navigation to the checkout endpoint if the route is known. | Access is denied. No checkout change is persisted. No history entry is created. |
'@

    "requirement-290764\006-inspection-required-and-retired-filters.md"                       = @'
# R10.2 Update for CR 286067 - Magnet Systems: Verify the Inspection Required and Retired filters function on the Magnet Systems list (Validation)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290764
- Priority: 2
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_View`.
- At least one magnet system exists with the inspection-required flag set.
- At least one magnet system exists without the inspection-required flag.
- At least one magnet system exists in Retired status.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | All active magnet systems are listed. |
| 2 | Apply the Inspection Required filter. | Only magnet systems with the inspection-required flag are displayed. |
| 3 | Clear the filter and apply the Retired status filter. | Only Retired magnet systems are displayed. |
| 4 | Clear the filter. | All magnet systems are displayed again. |
'@

    "requirement-290764\007-list-actions-based-on-permissions.md"                             = @'
# R10.2 Update for CR 286067 - Magnet Systems: Verify list-level actions are available based on tester permissions (Security)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirement ID: 290764
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester A is signed in with `MagnetSystem_Edit` and `MagnetSystem_View`.
- Tester B is signed in with `MagnetSystem_View` only.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | As Tester A open the 'Magnet Systems' list. | 'New' or create action is visible. |
| 2 | As Tester B open the 'Magnet Systems' list. | 'New' or create action is hidden or disabled. |
'@

    "e2e\001-full-lifecycle-hardware-component-to-install-and-logbook.md"                     = @'
# R10.2 Update for CR 286067 - End-to-End: Verify full lifecycle from existing hardware component to magnet system install and logbook entry (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 290757, 290765, 290777, 217766, 290771, 73375
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `HardwareConfiguration_Edit`, `ManageHardware_Edit`, `Logbook_View`.
- A hardware component exists in ERP that is not yet used as a Target Type or Magnet System Type.
- A module exists with a Magnet System role configured.
- A valid user and tool are available for checkout.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and create a new type using the available hardware component ERP article. | Magnet System Type is created with status Standard and the hardware component article is no longer available for Target Type or Magnet System Type creation. |
| 2 | Open the 'Magnet Systems' page and create a new magnet system using the type created in step 1. Enter a unique serial number. | Magnet System is created with an immutable MS number, the entered serial number, and status In Stock. |
| 3 | Open the new magnet system detail page and click 'Check Out'. Select a user and a tool. Confirm the checkout. | Status remains and a checkout history entry is recorded with timestamp, actor, selected user, and selected tool. |
| 4 | Open the module 'Hardware Configuration' page and start the install action for the Magnet System role slot. Select the checked-out magnet system. | Magnet System is installed. Module hardware configuration reflects the installed magnet system with serial number and type name. |
| 5 | Open the magnet system history. | A distinct install entry exists with timestamp, actor, module name, and tool name. |
| 6 | Open the tool logbook. | A Magnet System install entry exists in the logbook with timestamp, actor, magnet system number, and serial number. |
| 7 | Export the hardware configuration for the module. | Exported file contains the magnet system article number, serial number, and type name. |
'@

    "e2e\002-migration-legacy-hardware-component-role-to-new-model.md"                        = @'
# R10.2 Update for CR 286067 - End-to-End: Verify migration of existing legacy hardware component role to new magnet system model (Migration)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 290757, 290765, 290777, 290771, 73354
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `ManageHardware_Edit`, `HardwareConfiguration_Edit`, `Logbook_View`.
- A legacy hardware component role named Magnet Systems exists and is installed in a tool.
- Serial number data exists for the legacy role.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the relevant module 'Hardware Configuration' and record the existing legacy Magnet System role name, installed hardware component, and serial number. | Existing role details are visible and recorded. |
| 2 | Delete the existing legacy Magnet System hardware component role. | Role is removed from the module configuration. No other roles are affected. |
| 3 | Create a new Magnet System role on the module using the new Magnet System role type. | New role is created with Requires Serial Number locked to Yes. |
| 4 | Create a Magnet System Type from the hardware component ERP article that matches the legacy component. | Magnet System Type is created as Standard. |
| 5 | Create a new Magnet System using the new type and enter the original serial number. | Magnet System is created in In Stock status with the entered serial number. |
| 6 | Check out the new magnet system and install it in the module via 'Hardware Configuration'. | Magnet System is installed. Module reflects the new magnet system with correct serial number. |
| 7 | Open the magnet system history. | Checkout and install entries exist with correct timestamps and actor. |
| 8 | Open the tool logbook. | A Magnet System install entry exists referencing the new magnet system number and serial number. |
'@

    "e2e\003-migration-regression-legacy-role-deletion-no-side-effects.md"                    = @'
# R10.2 Update for CR 286067 - End-to-End: Verify legacy magnet system role deletion does not affect other module roles and associations are recreatable (Migration Regression)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 73354, 73375, 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `ManageHardware_Edit`, `HardwareConfiguration_Edit`, `MagnetSystem_Edit`.
- A module has multiple hardware component roles including a legacy Magnet Systems role and at least one other role.
- Learned associations exist for the legacy Magnet Systems role.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Record all existing roles and learned associations on the module. | Roles and associations are visible and recorded. |
| 2 | Delete the legacy Magnet Systems hardware component role. | Only the Magnet Systems role is removed. All other roles remain unchanged. |
| 3 | Verify learned associations for the deleted role are cleared. | Associations for the deleted role no longer appear. Associations for other roles are unaffected. |
| 4 | Add a new Magnet System role using the new role type. | New Magnet System role is created with Requires Serial Number locked to Yes and no pre-existing associations. |
| 5 | Add associations to the new Magnet System role. | Associations are saved and visible on the role. |
| 6 | Verify all other original roles remain intact with their original associations. | No unintended changes to other roles or associations. |
'@

}

$created = 0
$skipped = 0

foreach ($rel in $files.Keys) {
    $full = Join-Path $base $rel
    $dir = Split-Path $full -Parent

    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    if (Test-Path $full) {
        Write-Host "SKIP (exists): $rel" -ForegroundColor Yellow
        $skipped++
    }
    else {
        Set-Content -LiteralPath $full -Value $files[$rel].Trim() -Encoding UTF8
        Write-Host "CREATED: $rel" -ForegroundColor Green
        $created++
    }
}

Write-Host ""
Write-Host "Done. Created: $created  Skipped: $skipped" -ForegroundColor Cyan
