# PTO Operations Guide

## Getting PTO

Two options are commonly used:

- Installer-based setup (recommended for QA)
- Binary copy setup (common for developer environments)

Ensure matching BSM tool configuration files are copied into ProgramData tool configuration location.

## EIB Storage Setup

If EIBStorage DB does not exist:

1. Open Data Storage Admin utility.
2. Set server and keep default DB name.
3. Create database.

## Startup Sequence

1. Launch PTO Server Sim with BSM configuration.
2. Wait for maintenance/not initialized mode.
3. Launch PTO UI and log in.
4. Initialize system mode (skip substrate presence check if needed).
5. Apply plan under Substrate Reconciliation when prompted.

## Communication State Expectations

- Initial state can be Online, Not Communicating.
- After SECS/GEM connection, state should move to Online, Communicating.
- If needed, toggle Online Local in PTO host screen.

## Load Port and Job Operations

- Place/remove carrier and adjust slot maps in server simulator tabs.
- Use Quick Job Editor for load/unload and job creation.
- Assign recipes before creating jobs.

## Special Process Scenarios

- Flip: requires recipe step for substrate flip.
- Wafer ID read: requires SubstrateIdRead step; failure can be simulated and retried via alarm workflow.

## Dummy Substrates

Dummy transfer workflow uses PTO Maintenance > Dummy Transfer:

1. Select source component/slots.
2. Select destination component/slots.
3. Transfer and wait for completion.

## Target Life

- Count direction can be up or down based on equipment parameter.
- Initial and limit values are in process equipment parameters.
- Actual value is tracked in PLC tags.
- Target change requires reset flow; simulation often needs manual value alignment.

## Batch Tool Notes

For Clusterline200 BPME testing:

- Use matching batch tool recipe settings.
- Address initialization alarms (for example LP2 presence mismatch) using reconciliation/reinitialize steps.
- Keep rotation/location values aligned between simulator and configuration.

## Substrate Types (PTO Context)

- Pasting wafers
- Dummy wafers
- GSM wafers
- Maintenance wafers

Each has specific load, usage, and lifecycle behavior in PTO workflows.
