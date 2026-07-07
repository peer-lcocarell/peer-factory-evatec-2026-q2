# Skill - ADO Markdown Generation

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Azure DevOps Test Plans basics, markdown test case format, CR-to-suite mapping
- **Tags**: #ado #markdown #test-cases #publishing
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Generate Azure DevOps-compatible markdown test case files and publish commands for a target CR and suite. Use this prompt when moving authored test cases into ADO-ready folder and command outputs.

## Prompt Template

```
You are an ADO Markdown Generation Skill Assistant.

Inputs:
- [TEST_CASE_CONTENT]
- [CR_NUMBER]
- [SUITE_MAPPING_OR_SUITE_ID]
- [TARGET_PLAN_ID]

Context:
- [OUTPUT_DIRECTORY_RULE]: docs/.../change-requests/<CR>/test-cases/
- [ADO_DEFAULTS]: Org URL, project, API version

Requirements:
- Create one markdown file per test case using required ADO structure
- Apply sortable numeric filenames and preserve traceability fields
- Resolve suite ID from mapping and flag unresolved mappings
- Provide publish commands for folder and single-file execution
- Do not auto-run publish commands

Please provide:
- Generated markdown files and paths
- Scenario coverage summary
- Ready-to-run publish commands
```

## Customization Guide

### Placeholders Explained
- **[TEST_CASE_CONTENT]**: Source test case scenarios to format.
  - Example: `Generated cases for CR 286067 lifecycle`
  - Tips: Include explicit preconditions and expected outcomes.

- **[SUITE_MAPPING_OR_SUITE_ID]**: Suite source to map test cases.
  - Example: `scripts/ado/suite-map.json`
  - Tips: Prefer mapping file for consistency across releases.

### Optional Parameters
- **[TARGET_PLAN_ID]**: Test plan ID override.
  - Use when publishing to non-default validation plans.

## Example Usage

### Scenario
A QA engineer has finished writing CR test cases and needs ADO-compatible markdown plus publish commands.

### Filled Prompt
```
You are an ADO Markdown Generation Skill Assistant.

Inputs:
- [TEST_CASE_CONTENT]: CR 286067 create, install, uninstall, retire scenarios
- [CR_NUMBER]: 286067
- [SUITE_MAPPING_OR_SUITE_ID]: scripts/ado/suite-map.json
- [TARGET_PLAN_ID]: 291616

Context:
- [OUTPUT_DIRECTORY_RULE]: docs/.../change-requests/<CR>/test-cases/
- [ADO_DEFAULTS]: OrgUrl=https://ops1.peergroup.com/DefaultCollection, Project=PFEvatec

Requirements:
- Create one markdown file per test case using required ADO structure
- Apply sortable numeric filenames and preserve traceability fields
- Resolve suite ID from mapping and flag unresolved mappings
- Provide publish commands for folder and single-file execution
- Do not auto-run publish commands

Please provide:
- Generated markdown files and paths
- Scenario coverage summary
- Ready-to-run publish commands
```

### Expected AI Response
```
Files:
- 001-create-magnet.md
- 002-install-magnet.md

Publish Commands:
- invoke-ado-suite-publish-from-folder.ps1 ...
- invoke-ado-test-case-publish-from-markdown.ps1 ...
```

## Expected Output

The AI should provide:
1. ADO-compatible markdown files by scenario.
2. Path and coverage summary.
3. Publish commands for user execution.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Skill - PF Test Case Generation](../pf-test-case-generation/SKILL.md) - Produces scenario-level test cases.
- [Agent - QA Test Case Writer](../../agents/pf-qa-test-case-writer-agent-profile.agent.md) - Authoring-focused test design.
- [Agent - QA Test Case Review](../../agents/pf-qa-test-case-review.agent.md) - Validates readiness and quality.

## Additional Resources

- [Azure DevOps REST API](https://learn.microsoft.com/rest/api/azure/devops/testplan/) - Test plan API reference.
- [Azure DevOps Test Plans Overview](https://learn.microsoft.com/azure/devops/test/overview) - Test management concepts.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Markdown syntax reference.

## Tips for Best Results

1. **Be Specific**: Provide exact CR and suite mapping source.
2. **Iterate**: Generate files, review naming, then publish.
3. **Validate**: Confirm required sections in each markdown test case.
4. **Customize**: Override plan ID when targeting alternate plans.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [TEST_CASE_CONTENT]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
