<!--
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
-->

# QA Bug Trend Analysis Dashboard Generator

## Purpose

Analyze a markdown bug list and generate structured defect trend data suitable for creating an HTML dashboard report using PowerShell, .NET, or other reporting tools.

The output should focus on identifying recurring quality issues, risk areas, affected modules, root cause patterns, severity distribution, and actionable recommendations.

The generated data should be suitable for rendering into a professional QA metrics dashboard with charts and executive-level summaries.

Primary input file in this repository:

- docs/qa-documents/pf-evatec-phase-2/10-bug-audit/pf-evatec-r1-r10.2-all-real-bugs-not-reject-or-invalid.md

---

## Mode

```yaml
mode: ask
description: Generate structured defect trend analysis data and dashboard content from bug reports.
```

---

## Goal

Given project context and a collection of bug reports, perform an evidence-driven QA analysis and produce structured data suitable for:

- HTML dashboard generation
- PowerShell reporting tools
- .NET reporting services
- Release readiness reviews
- QA status reporting
- Stakeholder communications
- Defect triage meetings

The analysis must identify defect patterns, recurring issues, risk concentrations, and potential root causes while remaining independent of any specific application architecture or product implementation.

---

## Project Context (Informational Only)

The following information provides release and business context.

This information must be displayed in the final report but MUST NOT be used when calculating defect statistics, trends, root causes, risk levels, module rankings, severity counts, or dashboard charts.

### Project

PEER Factory Evatec Phase 2 - R10.2

### Version

R10.2

### Date

2026-07-06

### Executive Overview

PEER Factory Evatec R10.2 is a targeted functional release for Evatec AG delivering four validated change requests against the Phase 2 platform.

The primary deliverable is a new Magnet Systems tracking capability within Evatec Fabric, enabling lifecycle management of physical magnet components from creation through retirement.

Supporting changes include:

- Hardware component search improvements
- Article import enhancements
- WBS element field addition for self-service boxes

One additional patch (CR 290161) was delivered directly to the customer environment and is pre-validated.

This release requires full QA execution across functional, regression, and integration areas before production sign-off.

### Project Purpose

#### Primary Objective

Deliver R10.2 to Evatec AG with verified functional coverage across all four active change requests.

#### Problem Being Addressed

Evatec requires:

- Structured tracking of magnet systems within Fabric
- Improved hardware search capabilities
- Correct article import mappings
- WBS element support within self-service box workflows

#### Expected Value

The release should provide:

- End-to-end magnet lifecycle visibility
- Improved operational traceability
- Reduced manual tracking effort
- Improved hardware search experience
- Improved data import accuracy

---

## Important Analysis Rules

The Project Context section exists solely for business and release visibility.

DO NOT:

- Count release notes as defects
- Count change requests as bugs
- Count project objectives as findings
- Count release scope as issues
- Derive root causes from executive summaries
- Include project metadata in charts
- Include project metadata in statistics
- Include version or release information in defect trends
- Use CR numbers in root cause analysis
- Treat delivered functionality as affected modules unless referenced by actual defects

ONLY use bug records supplied in the Bug List section when generating:

- Trend analysis
- Defect distributions
- Severity metrics
- Priority metrics
- Root cause frequencies
- Risk assessments
- Module rankings
- Category rankings
- Heat maps
- Charts
- Dashboard metrics
- Executive findings

If no defect references exist for a feature mentioned in Project Context, exclude it from all trend calculations.

---

## Input

Provide a list of bugs that may contain some or all of the following fields:

- Bug ID
- Title
- Description
- Severity
- Priority
- Area
- Component
- Environment
- Build
- Release
- Assigned Team
- Tags
- Reproduction Steps
- Actual Result
- Expected Result

---

## Bug List

```text
[PASTE BUG LIST HERE]
```

---

## Parsing Workflow

1. Read the markdown source and split it into bug records.
2. Extract structured fields from each record:
    - Bug ID
    - Title
    - Description or symptom
    - Module or component
    - Environment
    - Build or version
    - Severity
    - Priority
    - Resolution notes
3. Normalize severity and priority before analysis:
    - Sev 1, S1, 1 - Critical -> Critical
    - Sev 2, S2, 2 - High -> High
    - Sev 3, S3, 3 - Medium -> Medium
    - Sev 4, S4, 4 - Low, 5 - Very Low -> Low
    - Pri 1, Priority 1 -> P1
    - Pri 2, Priority 2 -> P2
    - Pri 3, Priority 3 -> P3
    - Pri 4, Priority 4 -> P4
4. Normalize known synonyms where evidence supports grouping:
    - Login Page, Login Screen, Authentication UI -> Authentication
5. Map each bug to exactly one category.
6. Tag optional dimensions when available:
    - Subsystem
    - Root cause hint
    - Regression hotspot

---

## Analysis Instructions

### Step 1: Normalize Defects

Review all supplied bugs and normalize terminology where reasonable.

### Step 2: Categorize Bugs

Group each bug into one of the following categories:

- UI
- Backend
- API
- Database
- Configuration
- Performance
- Security
- Integration
- Infrastructure
- Installer
- Automation
- Reporting
- Workflow
- Validation
- Data Integrity
- Other

### Step 3: Identify Trends

Determine:

- Most frequent categories
- Most affected components
- Most affected subsystems
- Most common symptoms
- Repeat failure patterns
- Cross-module failures
- Environment-specific failures
- Build-specific failures

### Step 4: Severity Analysis

Calculate totals for:

- Critical
- High
- Medium
- Low

Identify:

- Highest-risk defects
- Release blockers
- Potential production-impacting issues

### Step 5: Priority Analysis

Calculate totals for:

- P1
- P2
- P3
- P4

Identify:

- Most urgent problem areas
- Priority concentration by component

### Step 6: Root Cause Analysis

Infer potential causes based only on provided evidence.

Examples:

- Execution workflow failure
- Possible configuration issue
- Possible communication failure
- Validation logic defect
- Data synchronization issue
- State management issue
- Dependency failure
- Product defect requiring investigation

Do not invent unsupported causes. If evidence is weak, set root cause to Unknown.

### Step 7: Risk Assessment

Identify:

- Highest-risk subsystem
- Regression hotspots
- Release readiness concerns
- Concentrated defect areas
- Areas requiring additional testing

### Step 8: Recommendations

Provide:

#### Immediate Actions

Required before release.

#### Near-Term Improvements

Recommended in upcoming iterations.

#### Preventive Actions

Process improvements intended to reduce future defect volume.

---

## Report Generation Requirements

The resulting data must support generation of an HTML dashboard containing the following sections:

### Release Information

Display informational project details.

#### Project

PEER Factory Evatec Phase 2 - R10.2

#### Version

R10.2

#### Date

2026-07-06

### Executive Dashboard

Display:

- Total Bugs
- Critical Bugs
- High Bugs
- Top Category
- Top Module
- Highest Risk Area
- Release Risk Level

### Charts

Generate data suitable for:

#### Category Distribution

Pie Chart

#### Severity Distribution

Doughnut Chart

#### Priority Distribution

Bar Chart

#### Module Distribution

Horizontal Bar Chart

#### Root Cause Frequency

Bar Chart

#### Risk Concentration

Heat Map

### Detailed Analysis

Display:

- Category Breakdown
- Severity Breakdown
- Priority Breakdown
- Module Breakdown
- Root Cause Analysis
- Risk Assessment

### Recommendations

Display:

- Immediate Actions
- Near-Term Improvements
- Preventive Actions

---

## Required Output Format

Return ONLY valid JSON.

```json
{
   "releaseInfo": {
      "project": "PEER Factory Evatec Phase 2 - R10.2",
      "version": "R10.2",
      "date": "2026-07-06"
   },
   "summary": {
      "totalBugs": 0,
      "criticalBugs": 0,
      "highBugs": 0,
      "topCategory": "",
      "topModule": "",
      "highestRiskArea": "",
      "releaseRisk": ""
   },
   "categories": [
      {
         "name": "",
         "count": 0
      }
   ],
   "severity": {
      "critical": 0,
      "high": 0,
      "medium": 0,
      "low": 0
   },
   "priority": {
      "p1": 0,
      "p2": 0,
      "p3": 0,
      "p4": 0
   },
   "modules": [
      {
         "name": "",
         "count": 0
      }
   ],
   "rootCauses": [
      {
         "cause": "",
         "count": 0
      }
   ],
   "riskAreas": [
      {
         "area": "",
         "riskLevel": "",
         "count": 0
      }
   ],
   "recommendations": {
      "immediateActions": [
         ""
      ],
      "nearTermImprovements": [
         ""
      ],
      "preventiveActions": [
         ""
      ]
   }
}
```

---

## Acceptance Criteria

The analysis is acceptable only if:

- Release context is displayed but excluded from calculations.
- Charts are based exclusively on defect data.
- Findings are evidence-based.
- Root causes are supported by defect information.
- Severity and priority counts are accurate.
- Risk areas are clearly identified.
- Recommendations are actionable.
- Output is valid JSON.
- Output can be directly consumed by PowerShell or .NET HTML report generators.
- Results are reusable across PTO, SST, Composer, PTC, Factory, API, UI, integration, automation, and regression testing projects.
- No product-specific assumptions are introduced without supporting bug evidence.

---

## Optional Automation Pattern

For script-based processing, use this staged pipeline:

1. Parse markdown into intermediate objects.
2. Normalize field values.
3. Classify category and root cause.
4. Aggregate counts and concentration metrics.
5. Generate JSON payload for dashboard rendering.

Keep parsing and classification rules in a configuration file so updates do not require code rewrites.
