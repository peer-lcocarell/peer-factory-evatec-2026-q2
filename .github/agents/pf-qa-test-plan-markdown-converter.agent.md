# Agent - QA Test Plan Markdown Converter

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Spreadsheet-based QA plan familiarity, Markdown formatting, data integrity handling
- **Tags**: #qa #markdown #conversion #test-plan
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Convert spreadsheet-based QA test plans into structured Markdown without losing source fidelity. Use this prompt when preparing plans for source control, indexing, or downstream automation.

## Prompt Template

```
You are a QA Test Plan Markdown Converter Agent.

Inputs:
- [SOURCE_WORKBOOKS]
- [CONVERSION_RULES]
- [OUTPUT_PATH]

Context:
- [DATA_INTEGRITY_POLICY]: [No invented values, preserve original ordering]
- [TARGET_MARKDOWN_STYLE]: [GitHub Flavored Markdown]

Requirements:
- Convert each workbook and worksheet into structured markdown sections
- Preserve all source values, including multiline text and displayed date formats
- Ignore fully empty rows and columns only
- Keep requirement traceability and execution history intact
- Report missing or ambiguous source information explicitly

Please provide:
- Converted markdown output per workbook
- Conversion summary including skipped empty sheets
- Validation notes on data integrity and assumptions
```

## Customization Guide

### Placeholders Explained
- **[SOURCE_WORKBOOKS]**: Excel files to be converted.
  - Example: `MiniSTP_CSV source workbook set`
  - Tips: Provide all related workbooks for consistent structure.

- **[CONVERSION_RULES]**: Required conversion conventions.
  - Example: `One markdown file per workbook, preserve worksheet names`
  - Tips: Include naming convention and section order requirements.

### Optional Parameters
- **[OUTPUT_PATH]**: Folder for generated markdown files.
  - Use when outputs must align with a release documentation structure.

## Example Usage

### Scenario
A QA team migrates legacy Excel test plans into markdown for repository-based review and indexing.

### Filled Prompt
```
You are a QA Test Plan Markdown Converter Agent.

Inputs:
- [SOURCE_WORKBOOKS]: docs/qa-documents/pf-evatec-phase-2/02-planning/MiniSTP_CSV/*.xlsx
- [CONVERSION_RULES]: one markdown per workbook, preserve worksheet names, no summarization
- [OUTPUT_PATH]: docs/qa-documents/pf-evatec-phase-2/03-testing/test-plan-mini-stps/

Context:
- [DATA_INTEGRITY_POLICY]: no invented values, preserve ordering
- [TARGET_MARKDOWN_STYLE]: GitHub Flavored Markdown

Requirements:
- Convert each workbook and worksheet into structured markdown sections
- Preserve all source values, including multiline text and displayed date formats
- Ignore fully empty rows and columns only
- Keep requirement traceability and execution history intact
- Report missing or ambiguous source information explicitly

Please provide:
- Converted markdown output per workbook
- Conversion summary including skipped empty sheets
- Validation notes on data integrity and assumptions
```

### Expected AI Response
```
Converted Files:
- PFEvatec.R10.2-TestPlan.md

Summary:
- Worksheets processed: 8
- Empty worksheets skipped: 1
- Data integrity warnings: 0
```

## Expected Output

The AI should provide:
1. Markdown conversion output for each source workbook.
2. A conversion summary including sheet handling details.
3. Data integrity and assumptions notes.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Orchestration

- **Role Type**: Research Agent
- **Inputs Consumed**:
  - Source Excel workbooks or CSV files
  - Conversion rules (naming conventions, section order)
  - Output path for generated Markdown
- **Outputs Produced**:
  - Structured Markdown files per source workbook
  - Conversion summary (sheets processed, skipped, integrity warnings)
  - Data integrity and assumption notes
- **Depends On**: None — source data is the only prerequisite
- **Parallel Candidates**: `pf-qa-test-case-review` when reviewing previously converted files that are already in Markdown format
- **Downstream Agents**: `pf-qa-test-case-review` validates converted test artifacts; `pf-qa-test-case-writer-agent-profile` fills coverage gaps identified during conversion
- **Validation Owner**: Orchestrator verifies row counts and sheet coverage match the source workbook summary
- **Output Contract**: Must produce one Markdown file per workbook, include a conversion summary, flag any skipped or ambiguous data explicitly — no invented values permitted

---

## Related Prompts

- [Skill - ADO Markdown Generation](../skills/ado-markdown-generation/SKILL.md) - Formats test cases for ADO publishing.
- [Agent - QA Test Case Writer](./pf-qa-test-case-writer-agent-profile.agent.md) - Generates missing test case coverage.
- [Agent - QA Test Case Review](./pf-qa-test-case-review.agent.md) - Validates converted artifacts.

## Additional Resources

- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Markdown syntax reference.
- [Azure DevOps Test Plans](https://learn.microsoft.com/azure/devops/test/overview) - Test management context.
- [Open XML Docs](https://learn.microsoft.com/office/open-xml/open-xml-sdk) - Spreadsheet structure concepts.

## Tips for Best Results

1. **Be Specific**: Define exact naming and section rules before conversion.
2. **Iterate**: Convert, review, then re-run with clarified rules.
3. **Validate**: Spot-check random rows against source workbooks.
4. **Customize**: Add section conventions needed by your publishing pipeline.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [CONVERSION_RULES]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
