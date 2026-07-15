# Audit - Requirement 264373
https://ops1.peergroup.com/DefaultCollection/PFEvatec/_testPlans/execute?planId=291616&suiteId=293638

## Requirement Reference

- CR: 286836
- Ticket: 34948
- Requirement ID: 264373
- Requirement: Load BOM from File

## Requirement Summary

- User selects a BOM file for import.
- PF parses the file and generates a BOM tree for display.
- Default mapping includes Article #, Level, Name, Product Group, Quantity, and Units.
- Custom formats are supported.
- Custom format mappings are required for all headers except `Name (English)`.

## Existing Test Coverage

- 001-load-bom-from-file-valid-file-happy-path.md
- 002-load-bom-from-file-missing-required-mapping-unhappy-path.md
- 003-load-bom-from-file-regression-parsing-consistency.md
- 004-load-bom-from-file-large-file-responsiveness-risk-based.md

## Coverage Assessment

- Happy path coverage: Present.
- Mapping validation coverage: Present.
- Regression stability coverage: Present.
- Large file performance coverage: Present.
- Permission coverage for access control: Missing.

## Recommendations

- Add permission unhappy path test if access rights are enforced in this flow.

13.4.8.2REQUIREMENT: Load BOM from File
The user will be able to select a BOM file. PF will parse the file to generate the BOM tree structure for display.

By default the BOM file format is

PF Name

Report Column Name

Article #

Article Number

Level

#

Name

Description

Name (English)

Description English

Product Group

Product Group

Quantity

Quantity

Units

Units

Custom File Formats
When importing the user will be able to manage custom file formats (edit existing or create new ones).

The rules for a file format are

There must be a unique name (maximum 50 characters)

A mapping must be provided for all headers with the exception of ‘Name (English)’ which is optional
