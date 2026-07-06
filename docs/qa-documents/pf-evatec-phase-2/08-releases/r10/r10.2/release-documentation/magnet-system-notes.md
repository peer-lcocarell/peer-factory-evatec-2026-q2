
Agenda

- [ ] PF Evatec - Magnet Systems Kickoff
- [ ] 
Meeting Notes
Overview

- Magnet Systems are a new feature that work similarly to Target Types. 
- Magnet System Type = configuration definition. 
- Magnet System = actual item that uses a Magnet System Type. 
- Multiple Magnet Systems can reference the same Magnet System Type. 
- Multiple Magnet Systems can reference the same Prototype Magnet System Type. 
Purpose

- Magnet Systems allow customers to manage and test magnet configurations without impacting production setups. 
- Customers can create and evaluate new magnet configurations independently from production configurations. 
- Prototype Magnet System Types provide a safe environment for developing, testing, and validating configuration changes. 
- Changes can be reviewed and refined through Prototype versions before being promoted to a Standard configuration. 
- Existing production Magnet Systems remain unaffected while Prototype configurations are being tested. 
Standard Functionality

- Standard functionality will include: 
- Create 
- View 
- Edit 
- Delete 
- List view 
- Document management 
- Security permissions 
- Read-only mode 
Applications Field

- A new Applications field will be added. 
- Supports multiple selections. 
- Supports predefined and custom values. 
- Displays values as a comma-separated list.

Prototype Support

- Users can create Prototype versions of Magnet System Types for testing and experimentation. 
- New Magnet System Types AND Magnet Systems  are created as Standard. 
- Prototype versions can be created from: 
- A Standard type 
- An existing Prototype type 
- Changes are made by assigning a Magnet System to a Prototype Magnet System Type rather than modifying the Standard type directly. 
- Multiple Magnet Systems can reference the same Prototype type. 
Variant Codes
Prototype types use version codes such as:

- V01 
- V02 
- V03 
History and Traceability

- Magnet System Types will include history tracking that shows: 
- The source of each Prototype 
- Relationships between Standard and Prototype types 
- The complete configuration lineage 
- History is maintained throughout the Prototype and Standard lifecycle. 
Prototype to Standard Workflow

- A Prototype uses a unique Article Number (External ID) that does not exist as a Hardware Component. 
- The Prototype can be tested and updated through multiple versions. 
- When ready for production, a new Hardware Component is created in the external system and imported into Fabric. 
- The Prototype is then promoted to a Standard Magnet System Type and linked to the Hardware Component. 
- Promotion does not create a new type. 
- Existing Magnet Systems remain linked to the promoted type. 
Article Numbers (Dummies)

- When a Magnet System Type is converted to a Prototype, the user must enter a unique Article Number. 
- The Article Number is stored in External ID. 
- The Article Number acts as a temporary identifier for the Prototype. 
- The Article Number must be unique within the system. 
- The Article Number must not match an existing Hardware Component Article Number. 
- Different Prototype versions can have different Article Numbers. 
Retirement and Labels

- Magnet Systems can be retired, like Targets. 
- Users can print labels for Magnet Systems. 
- Prototype labels include the Variant Code (V01, V02, etc.). 
- Labels include a QR code. 
- The QR code contains the Magnet System number. 
Checkout and Return

- Magnet Systems support a checkout and return workflow. 
- This functions similarly to an inventory management process. 
- Additional checkout and return details are still being defined. 
- I.E Checkout for installation, to put in the tool.
Hardware Configuration Changes

- Updates will be made to the existing Hardware Configuration functionality to support Magnet Systems. 
- Under Manage Hardware Component Roles, a new Role Type called Magnet System will be added. 
- The Magnet System role will behave the same as the existing Target role. 
- Requires Serial Number will always be set to Yes for Magnet Systems. 
- Users will not be able to change the Requires Serial Number setting. 
- All other configuration settings and behavior should follow the Target implementation. 
- If there is uncertainty about expected behavior, use the Target role as the reference example. 
Existing Magnet System Migration

- Existing Magnet System configurations may require migration to the new Magnet System model. 
- Automatic conversion of historical Magnet System roles is still under discussion. 
- Due to historical serial number data and existing associations, automated migration may be difficult. 
- The current approach being considered is: 
- Delete the existing Magnet System role. 
- Create a new Magnet System role using the new functionality. 
- Recreate any required associations. 
Magnet System Installation

- Magnet Systems will be managed through Tool Hardware Configuration similar to Targets. 
- Users can: 
- Install a Magnet System 
- Uninstall a Magnet System 
- Replace an installed Magnet System with another Magnet System 
- The installation workflow is intended to be simpler than the existing Target replacement workflow. 
- Available Magnet Systems for installation must: 
- Be checked out 
- Not currently be installed 
- The list is not restricted to Magnet Systems checked out by the current user. 
- The checkout owner will be displayed and available for filtering. 
Installation Workflow Context

- After a Magnet System is checked out for installation, it must be associated with the tool through Hardware Configuration. 
- Support for the new Magnet System role in Hardware Configuration enables this installation process. 
Logbook and History

- Modules and Tools will include Magnet System entries in the Logbook. 
- A new Magnet System filter/category will be added to the Logbook. 
- Logbook behavior will be similar to the existing Target implementation. 
- When a Magnet System is installed into a Tool, a new history record is created on the Magnet System itself. 
- History records provide traceability of where and when a Magnet System was installed.
Additional Notes / Impacted Areas
Hardware Component Usage

- When creating a Magnet System Type from a Hardware Component, that Hardware Component should no longer be available for use as a Target Type. 
- Hardware Components should only be associated with one applicable physical item type to avoid conflicts. 
Existing Functionality Impacted
The Magnet System feature impacts several existing areas of the application, including:

- Hardware Component Roles 
- Learned Associations 
- Remove Associations 
- Install / Uninstall workflows 
- Hardware Configuration management 
- Export Hardware Configuration 
- Logbook functionality 
- History tracking 
Hardware Configuration Export

- Export Hardware Configuration will be updated to support Magnet Systems. 
- Exported data may include Magnet System details such as Article Number and Variant Code where applicable. 
Physical Asset Behavior

- From a Hardware Configuration perspective, Magnet Systems should behave similarly to Targets. 
- Magnet Systems are treated as physical assets installed on a Tool. 
- Installation and replacement actions must be tracked through Hardware Configuration workflows. 
Copy Functionality

- Copy functionality is expected to support Magnet Systems. 
- Requirements and final behavior are still being reviewed. 
Open Questions

- Some requirements may be legacy items from earlier design discussions and require further clarification. 
- There may be additional impacts related to Logbook deletion/history behavior that still need to be reviewed. 
- QA assumes a big change like this could add regression/changes to DB / etc. This has a big big impact/footprint on app - potential for issues.
- Time - Line: 2 weeks of dev. Test cases required. Time provided.
- USE CASE: have a hw component named Magnet Systems in a role named Magnet Systems -- i.e in video -- installed at least hw component then take that exact hw component and make it a magnet system then installed - end use case primary - Existing customer Hardware Components may already be installed and associated with tools. Key use case. 
- HW Config think of one big use case.
- Task against CR.
