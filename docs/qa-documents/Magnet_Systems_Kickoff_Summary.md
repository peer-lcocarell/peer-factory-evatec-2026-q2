# PF Evatec - Magnet Systems Kickoff

## Overview

- Magnet Systems are a new feature that function similarly to Target Types.
- Magnet System Type = configuration definition.
- Magnet System = actual item that uses a Magnet System Type.
- Multiple Magnet Systems can reference the same Magnet System Type.
- Multiple Magnet Systems can reference the same Prototype Magnet System Type.

## Purpose

- Allow customers to develop, test, and manage magnet configurations without impacting production setups.
- Prototype configurations can be evaluated independently from production configurations.
- Existing production Magnet Systems remain unaffected while prototype changes are being tested.

## Core Functionality

- Create
- View
- Edit
- Delete
- List View
- Document Management
- Security Permissions
- Read-Only Mode

## Applications Field

- Supports multiple selections.
- Supports predefined and custom values.
- Displays values as a comma-separated list.

## Prototype Support

- New Magnet System Types are created as Standard by default.
- Prototype versions can be created from a Standard type or an existing Prototype type.
- Multiple Magnet Systems can reference the same Prototype type.
- Changes are made by assigning Magnet Systems to Prototype Magnet System Types rather than modifying Standard types directly.

## Variant Codes

- V01
- V02
- V03

## History and Traceability

- Tracks the source of each Prototype.
- Tracks relationships between Standard and Prototype types.
- Maintains complete configuration lineage.

## Prototype to Standard Workflow

- Prototype uses a unique Article Number (External ID).
- Prototype Article Numbers must not exist as Hardware Components.
- Hardware Component is created in an external system and imported into Fabric.
- Prototype is promoted to a Standard Magnet System Type and linked to the Hardware Component.
- Promotion does not create a new type.

## Article Numbers (Dummies)

- Temporary identifiers for Prototype Magnet System Types.
- Stored in External ID.
- Must be unique.
- Must not match an existing Hardware Component Article Number.

## Retirement and Labels

- Magnet Systems can be retired similar to Targets.
- Users can print labels.
- Prototype labels include Variant Codes.
- QR codes contain the Magnet System number.

## Checkout and Return

- Supports checkout and return workflows.
- Common use case is checkout for installation into a Tool.

## Hardware Configuration Changes

- New Hardware Component Role Type: Magnet System.
- Behaves similarly to the Target role.
- Requires Serial Number is always Yes and cannot be changed.

## Migration

- Existing Magnet System configurations may require migration.
- Automated conversion is still under discussion.
- Current approach: delete existing role, create a new Magnet System role, and recreate associations.

## Installation

- Supports Install, Uninstall, and Replace operations.
- Available Magnet Systems must be checked out and not currently installed.
- Checkout owner can be displayed and filtered.

## Logbook and History

- New Magnet System logbook category/filter.
- Installing a Magnet System creates a history record on the Magnet System itself.

## Additional Impacted Areas

- Hardware Component Roles
- Learned Associations
- Remove Associations
- Hardware Configuration
- Import/Export
- Copy Functionality
- Logbook
- History Tracking

## Hardware Component Usage Rules

- A Hardware Component used for a Magnet System Type should no longer be available as a Target Type.
- Hardware Components should only be associated with one physical item type.

## Key QA Use Case

- Existing Hardware Components may already be installed and associated with Tools.
- Convert an existing Hardware Component into a Magnet System.
- Verify installation, associations, history, exports, and Hardware Configuration continue to function correctly.

## QA Considerations

- Large application footprint.
- Significant regression testing expected across hardware configuration, database changes, history, logbooks, imports/exports, permissions, and learned associations.

## Timeline

- Estimated development effort: 2 weeks.
- QA test cases, estimates, and planning required.
