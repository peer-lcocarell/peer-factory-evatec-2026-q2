# PFDB Database Investigation Notes

## Summary
PFDB appears to be a semiconductor manufacturing process database focused on substrate tracking, equipment management, process data collection, analysis workflows, and historical traceability. Analysis was based on table row counts and stored procedure names.

## Database Overview
PFDB appears to support:

- Process data collection
- Substrate and carrier (FOUP) tracking
- Equipment configuration management
- Analysis and reporting workflows
- Historical auditing and traceability
- SECS/GEM alarm integration

The database structure resembles systems used in semiconductor MES, metrology, process monitoring, FDC, yield analysis, or EDA-related environments.

## Core Functional Areas

### Equipment Management
Key tables:

- Tool
- Module
- HardwareComponent
- SupportedModuleType
- ToolType
- ToolModuleHistory
- ToolSoftwareHistory

Purpose:

- Define equipment
- Maintain equipment configuration
- Track hardware changes
- Store equipment history

### Production Tracking
Key tables:

- Substrate
- Batch
- WorkOrder
- Job
- SubstrateCollection
- Locator
- Stage

Purpose:

- Track substrates and wafers
- Manage jobs and work orders
- Monitor substrate movement through stages
- Maintain genealogy and traceability

### Process Data Collection
Key tables:

- ProcessMeasurementxxxxx
- ProcessAttributexxxxx
- ProcessFilexxxxx
- MeasurementSet
- MeasurementSetDataContext
- DataContext
- DataItem
- DataSet

Purpose:

- Store measurement values
- Store process metadata
- Manage collected files
- Link measurements to production context

### Analysis Engine
Key tables:

- AnalysisRequest
- JobAnalysisRequest
- AnalysisMeasurementxxxxx
- AnalysisAttributexxxxx

Purpose:

- Process analysis requests
- Generate analysis results
- Store analytical measurements

### Audit and Traceability
Key tables:

- TrackingHistory
- Logbook
- LogbookValueChange
- LogbookTargetChange
- UserToolHistory
- UserProjectHistory

Purpose:

- Change tracking
- Audit trail maintenance
- Historical reporting

## Largest Tables by Row Count

| Table | Rows |
|---------|---------:|
| ProcessMeasurement00015 | 173,349 |
| ProcessMeasurement00018 | 87,938 |
| ProcessModuleContext | 85,813 |
| ProcessMeasurement00013 | 35,319 |
| MeasurementSet | 35,055 |
| HardwareComponent | 30,479 |
| ProcessMeasurement00004 | 29,104 |
| ProcessMeasurement00009 | 25,888 |
| ProcessMeasurement00014 | 13,169 |
| ProcessContext | 11,984 |
| Stage | 11,829 |

## Key Stored Procedures

### Process Data

- AddProcessData
- GetProcessData
- DeleteProcessData
- GetRawData
- GetToolRawData
- HasProcessData
- AddProcessFiles
- GetProcessFiles
- RemoveProcessFile

### Analysis

- CheckForAnalysis
- FindAnalysisRequests
- GetAnalysisRequestDetails
- GetMeasurementSetsForAnalysis
- StoreAnalysisResults
- DeleteAnalysisResults
- UpdateAnalysisRequests

### Substrate Tracking

- FindSubstrate
- TrackInSubstrate
- TrackOutSubstrate
- UpdateSubstrate
- UpdateSubstrateAtModule
- GetSubstrateInfo
- GetToolSubstrateHistory

### FOUP and Carrier Management

- TrackInFoup
- TrackOutFoup
- ReconcileFoup
- AssociateSubstratesToCarrier
- UpdateCarrierSubstrateAssociation
- UpdateCarrierAtModule

### Equipment Management

- GetInstalledHardwareComponents
- GetHardwareComponentsByRole
- CompleteHardwareComponentMerge

### Stage Management

- MaintainStages
- UpdateStages
- GetStageHistory
- GetSubStageHistory
- GetSubStages

### Alarm Handling

- AddOrUpdateSecsGemAlarm
- ClearToolAlarm

## Architecture Findings

### Numbered Measurement Tables

A significant portion of the schema uses numbered table patterns:

- ProcessMeasurement00004 through ProcessMeasurement00071
- ProcessAttribute00004 through ProcessAttribute00071
- AnalysisMeasurement00004 through ProcessMeasurement00071
- AnalysisAttribute00004 through AnalysisAttribute00071
- ProcessFile00004 through ProcessFile00071

This suggests:

- Dynamic schema generation
- Measurement partitioning
- Framework-driven table creation
- Process-specific physical storage tables

### Heavy Measurement Focus

The largest tables are measurement-oriented, indicating measurement collection is one of the primary responsibilities of PFDB.

### Framework-Oriented Design

Stored procedure names are generic and reusable rather than business-specific.

Examples:

- AddProcessData
- AddOrFindProcessContext
- AddOrFindProcessModuleContext
- UpdateDataItems

This suggests PFDB acts as a reusable process framework rather than a single-purpose application database.

## Potential Technical Debt

### Large Number of Empty Tables

Numerous tables currently contain zero rows.

Examples include:

- ProcessMeasurement00055+
- AnalysisMeasurement00055+
- ProcessAttribute00055+
- AnalysisAttribute00055+

Potential concerns:

- Legacy definitions
- Unused measurement schemas
- Increased maintenance complexity
- Documentation challenges

### Schema Complexity

The extensive use of numbered tables increases:

- Database administration complexity
- Query complexity
- Onboarding effort
- Reporting complexity

## Data Flow Hypothesis

1. Tool generates process data.
2. AddProcessData stores measurements.
3. Measurement records are linked to context tables.
4. Analysis requests are created.
5. Analysis engine processes measurement data.
6. Results are stored through StoreAnalysisResults.
7. Historical records are maintained for traceability.

## Recommended Investigation Areas

### High Priority

Review definitions for:

- MeasurementSet
- DataContext
- DataItem
- ProcessContext
- ProcessModuleContext
- ProcessMeasurement00015

### Stored Procedures to Analyze

Review source definitions for:

- AddProcessData
- AddProcessPartitions
- AddOrFindProcessContext
- AddOrFindProcessModuleContext
- StoreAnalysisResults
- UpdateDataItems

### Additional Metadata Collection

Export:

- Table and column definitions
- Primary keys
- Foreign keys
- Index definitions
- View definitions

## Cleanup Opportunities

Potential opportunities after validation:

- Identify permanently unused numbered tables
- Review measurement partitioning strategy
- Consolidate obsolete metadata definitions
- Improve schema documentation
- Review index maintenance strategy
- Establish archival and retention policies

## Open Questions

- Why are measurement tables partitioned into numbered physical tables?
- Are zero-row measurement tables still required?
- Which application components depend on the empty tables?
- How are measurement sets mapped to numbered measurement tables?
- What triggers analysis request creation?
- Is PFDB used directly by equipment, middleware, or both?
