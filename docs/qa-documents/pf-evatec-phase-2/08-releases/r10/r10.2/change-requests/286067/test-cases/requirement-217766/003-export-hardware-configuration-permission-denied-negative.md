# R10.2 Update for CR 286067 - Export Hardware Configuration: Attempt to export hardware configuration without the required permission (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- A user account exists that has `HardwareConfiguration_View` permission but NOT `HardwareConfiguration_Edit` permission.
- A tool with a saved hardware configuration exists.
- Assumption: Export requires `HardwareConfiguration_View` at minimum; confirm whether `HardwareConfiguration_Edit` is additionally required.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as a user with `HardwareConfiguration_View` but without `HardwareConfiguration_Edit` permission. | Login succeeds. |
| 2 | Navigate to the 'Hardware Configuration' page for a tool with existing configuration. | The Hardware Configuration page loads. The configuration data is displayed in read-only mode. |
| 3 | Locate the Export action. | The Export action is either visible but disabled, or not present in the interface. |
| 4 | Attempt to trigger the Export action. | Export is not available or is rejected. An access-denied or disabled state message is displayed. No file is generated. |

## Expected Outcome
A user without the required permission for the Export action cannot generate a hardware configuration export file. The action is either not presented or disabled in the UI. No export file is produced.
