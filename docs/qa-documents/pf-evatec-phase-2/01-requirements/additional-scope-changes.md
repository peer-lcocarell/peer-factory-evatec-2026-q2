### Additional Requirements & Scope Changes Identified

#### Modify Magnet System Requirements

* Magnet System modification is only permitted when:
  * The Magnet System is not retired.
  * Status is **Checked Out** (not installed in a tool).

* Users must choose one of two modification paths:
  * Assign an existing Prototype Magnet System Type.
  * Create a new Prototype Magnet System Type derived from the currently assigned type.

* If an existing Prototype type is selected:
  * The system uses that Prototype type.
  * If the selected Prototype does not match the current Magnet System Type lineage, the user must confirm the selection.
  * Information is presented in read-only mode where applicable.

#### Prototype Creation Requirements

* New Prototype Magnet System Types are created using the current Magnet System Type as the predecessor/base.
* Prototype types must maintain a relationship to their originating Magnet System Type.
* History must record the source Magnet System Type used during creation.
* The first Prototype created from a Standard type receives Variant Code **V01**.
* Subsequent Prototype generations increment the Variant Code.

Example:

```text
Standard Type
    |
    +-- Prototype V01
            |
            +-- Prototype V02
                    |
                    +-- Prototype V03
```

* Variant Codes represent successive experimental iterations of the same Magnet System Type lineage.

#### Prototype History Requirements

* History must support traceability between:
  * Standard Magnet System Types
  * Prototype Magnet System Types
  * Successive Prototype generations

* Users must be able to determine:
  * Which type a Prototype was created from.
  * The Prototype version/variant.
  * The evolution path of a Magnet System Type.

* History will use a timeline-style presentation rather than a simple audit table.

* Additional details can be displayed within history entries when needed.

#### Modify Magnet System Data Rules

When creating a Prototype:

* Article Number
  * Required.
  * Defaults from the selected Prototype if available.
  * Maximum 60 characters.
  * Must not already exist in the hardware component list.

* Description
  * Required.
  * Maximum 500 characters.

* Applications
  * Inherited from the current Magnet System Type.
  * Editable.

* Name
  * Inherited from the current Magnet System Type.
  * Read-only.

* Source Type
  * Inherited from the current Magnet System Type.
  * Read-only.

* FlexiCat Type
  * Inherited from the current Magnet System Type.
  * Read-only.

#### Save Processing Requirements

Upon save:

1. System determines whether a new Magnet System Type is required.
2. If required:
   * Create the new Prototype Magnet System Type.
   * Associate it with its predecessor.
   * Increment the Variant Code appropriately.
   * Add an entry to Magnet System Type history.
3. Update the Magnet System to reference the new or selected type.
4. Set the Magnet System Last Inspection Date to the current date.

***

### Additional QA Risks & Validation Areas

#### Prototype Lineage Validation

* Verify correct parent-child relationships across multiple Prototype generations.
* Verify Variant Code sequencing:
  * V01
  * V02
  * V03
  * etc.
* Verify lineage remains intact after edits and saves.
* Verify reassignment to existing Prototype types.

#### History Validation

* Verify history entry creation during Prototype creation.
* Verify history displays source type relationships.
* Verify timeline-style history presentation.
* Verify multiple Prototype generations appear correctly.
* Verify Prototype and Standard classifications are visible.

#### Business Rule Validation

* Verify modification blocked for retired Magnet Systems.
* Verify modification blocked when Magnet System is installed in a tool.
* Verify Checked Out requirement enforcement.
* Verify confirmation dialog behavior for unrelated Prototype selection.

#### Data Integrity Validation

* Verify inherited fields populate correctly.
* Verify read-only restrictions on inherited fields.
* Verify Applications field inheritance and editability.
* Verify Last Inspection Date updates after save.
* Verify original Standard type remains unchanged following Prototype creation.

### Additional Key Decisions

* Standard Magnet System Types are referred to as **Standard** rather than non-prototype types.
* Prototype lineage is a core business requirement and must be visible through History.
* Variant Codes are the mechanism used to identify successive Prototype versions derived from the same Magnet System Type lineage.
* History is intended to provide relationship context and evolution tracking, not merely change auditing.
