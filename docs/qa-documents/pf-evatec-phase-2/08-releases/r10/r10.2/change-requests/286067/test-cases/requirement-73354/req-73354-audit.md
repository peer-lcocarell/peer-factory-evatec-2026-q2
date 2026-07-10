# R10.2 Test Case Improvement Instructions
## CR 286067 - Magnet System Support in Logbook Configuration

## Objective

Review and improve the existing R10.2 test cases to increase requirement coverage, improve validation, and strengthen regression testing for the Magnet System implementation.

This document applies only to the following four R10.2 test cases:

1. Verify tester can assign a role to a logbook configuration and save changes (Happy Path)
2. Verify validation is displayed when no role is selected (Unhappy Path)
3. Verify the serial number requirement is locked to Yes and cannot be changed for a Magnet System role type (Regression)
4. Attempt to add a role with a duplicate role name to a logbook category (Validation)

---

# Requirement Coverage Reference

Requirement 13.1.2.4 includes the following functionality:

- Role names are sourced from predefined type:
  - Module Type → Role Name
- New roles default to:
  - Hardware Component
- Supported role types:
  - Hardware Component
  - Target
  - Magnet System
  - Text
  - File
  - Custom Logbook Role Types
- Hardware Component serial number requirement is editable.
- Target serial number requirement is always Yes and read-only.
- Magnet System serial number requirement is always Yes and read-only.
- Hardware Component, Target, and Magnet System roles can have keywords.
- All role types have an Always Active flag.
- Always Active defaults to No.
- Users must have ManageHardware_Edit permission.
- Role names must be unique within the category.

---

# Test Case 1

## Current Test

### Verify tester can assign a role to a logbook configuration and save changes (Happy Path)

---

## Recommended Improvements

### Validate Role Name Source

Add action:

```text
Review the available values in the Role Name selection list.
```

Add expected result:

```text
The Role Name list contains predefined values from
Module Type → Role Name.
```

---

### Validate Default Role Type

Add action:

```text
Review the Role Type field before making any changes.
```

Add expected result:

```text
The default Role Type is Hardware Component.
```

---

### Validate Always Active Default

Add action:

```text
Review the Always Active setting.
```

Add expected result:

```text
The Always Active value is No.
```

---

### Improve Persistence Validation

After save, add:

```text
Close Manage Hardware.

Reopen Manage Hardware.

Navigate back to the same logbook category.
```

Add expected result:

```text
The role remains present.

The selected Role Type remains unchanged.

The Requires Serial Number value remains unchanged.

The Always Active value remains unchanged.
```

---

## Reason

These additions validate:

- Role Name predefined type requirement
- Default Role Type requirement
- Always Active default requirement
- Configuration persistence

None of these are currently validated.

---

# Test Case 2

## Current Test

### Verify validation is displayed when no role is selected (Unhappy Path)

---

## Recommended Improvements

### Verify No Record Is Created

Add action:

```text
Review the role list after the save attempt is blocked.
```

Add expected result:

```text
No new role is added to the category.
```

---

### Add Persistence Validation

Add actions:

```text
Leave the category.

Return to the category.
```

Add expected result:

```text
The invalid role does not exist.

The role list remains unchanged.
```

---

## Reason

Current validation only confirms the error message appears.

It does not confirm:

- No role was created
- No invalid data was retained

---

# Test Case 3

## Current Test

### Verify the serial number requirement is locked to Yes and cannot be changed for a Magnet System role type (Regression)

---

## Recommended Improvements

### Verify Save Behavior

Add action:

```text
Save the configuration.
```

Add expected result:

```text
The configuration is saved without validation errors.
```

---

### Verify Persistence

Add actions:

```text
Close Manage Hardware.

Reopen Manage Hardware.

Navigate back to the same category.

Review the Magnet System role.
```

Add expected results:

```text
The role remains configured as Magnet System.

Requires Serial Number remains Yes.

The field remains read-only.

The setting cannot be modified.
```

---

### Verify Target Role Persistence

Current test validates Target behavior only once.

Add action:

```text
Review an existing Target role after reopening.
```

Add expected result:

```text
Requires Serial Number remains Yes.

The setting remains read-only.
```

---

## Reason

Current testing confirms UI behavior but does not confirm database persistence.

Configuration persistence is a high-risk area for this CR.

---

# Test Case 4

## Current Test

### Attempt to add a role with a duplicate role name to a logbook category (Validation)

---

## Recommended Improvements

### Verify Duplicate Record Is Not Stored

Add actions:

```text
Attempt to save the duplicate role.

Refresh the category.

Review the role list.
```

Add expected results:

```text
Save remains blocked.

Only one instance of the role exists.

No duplicate role is present.
```

---

### Verify Validation Clears Correctly

Add action:

```text
Replace the duplicate role name with a unique value.
```

Add expected result:

```text
The validation message is removed.
```

---

### Verify Persistence

Add actions:

```text
Save the unique role.

Close Manage Hardware.

Reopen the category.
```

Add expected result:

```text
The new unique role is displayed.

No duplicate role exists.
```

---

## Reason

Current test validates the warning message but does not prove:

- Duplicate data was not stored
- Duplicate data was not persisted
- Validation clears correctly

---

# General Improvements for All Four Tests

## Add Persistence Verification

Whenever a configuration is saved, include:

```text
Save the configuration.

Close Manage Hardware.

Reopen Manage Hardware.

Return to the modified category.
```

Expected Result:

```text
All saved values persist after reopening.
```

---

## Validate Actual Saved State

Do not stop validation after Save.

Always verify:

```text
Saved configuration values

Role Type

Requires Serial Number

Always Active

Role Name
```

after reopening the category.

---

## Use Consistent Terminology

Use:

```text
Tester
```

instead of:

```text
User
Operator
```

where applicable.

---

## Use Observable Expected Results

Expected Results should describe:

```text
Displayed values

Read-only states

Validation messages

Saved records

Persisted data
```

Avoid implementation assumptions.

---

# Remaining Requirement Gaps

The following requirements are not covered by the existing four R10.2 tests and require separate test cases if full requirement coverage is desired:

```text
Hardware Component serial number behavior

Keywords for Hardware Component

Keywords for Target

Keywords for Magnet System

Text role type

File role type

Custom Logbook Role Types

ManageHardware_Edit security rights

Role Type switching behavior

Always Active behavior beyond default validation
```

These items should be tracked as new test cases rather than modifications to the existing four R10.2 tests.

---

# Priority Improvements

Highest priority updates to the existing R10.2 tests:

1. Validate default Role Type = Hardware Component
2. Validate Always Active defaults to No
3. Validate Role Names come from predefined types
4. Add save and reopen persistence checks
5. Verify duplicate roles are not stored
6. Verify Magnet System and Target serial number settings persist after reopening

These updates provide the greatest increase in requirement coverage while keeping the current R10.2 test suite structure intact.
