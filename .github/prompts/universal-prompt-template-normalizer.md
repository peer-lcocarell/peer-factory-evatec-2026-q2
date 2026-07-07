# Prompt Engineering - Universal Prompt Template Normalizer

## Metadata
- **Difficulty**: Intermediate
- **Estimated Time**: 15min
- **Prerequisites**: Basic Markdown editing, prompt design fundamentals, source prompt files
- **Tags**: #prompt-engineering #template-enforcement #markdown #normalization
- **Last Updated**: 2026-07-07
- **Version**: 1.0

## Objective
Standardize one or more prompt files to a consistent structure and quality bar using the required template. Use this when normalizing prompt libraries across agents, skills, and reusable prompt docs.

## Prompt Template

```
You are a Prompt Template Normalization Assistant.

Input:
- [SOURCE_FILES]: [List of prompt files to normalize]
- [TARGET_MODE]: [Overwrite or create-new]
- [DOMAIN_CONTEXT]: [Project, team, and usage context]

Context:
- [TEMPLATE_STANDARD]: Enforce exact headings and section order
- [QUALITY_RULES]: Keep intent, improve clarity, preserve domain logic

Requirements:
- Normalize each source file to the required template format
- Keep unknown values as placeholders in [BRACKETS]
- Preserve critical constraints and behavior from the original prompt
- Include examples and troubleshooting guidance
- Provide a per-file change summary and assumptions list

Please provide:
- Normalized prompt file content for each input file
- Validation checklist confirming all required template sections are present
- Assumptions and unresolved gaps for each file
```

## Customization Guide

### Placeholders Explained
- **[SOURCE_FILES]**: Prompt files that need normalization.
  - Example: `.github/agents/*.agent.md`
  - Tips: Provide explicit paths for deterministic processing.

- **[DOMAIN_CONTEXT]**: Product and audience context used to tailor wording.
  - Example: `PF Evatec QA release tooling`
  - Tips: Include domain nouns used by your team.

### Optional Parameters
- **[TARGET_MODE]**: Controls overwrite behavior.
  - Use `create-new` when you want side-by-side review before replacing originals.

## Example Usage

### Scenario
A QA lead wants all agent and skill prompts in the repo to match one publishable template before release.

### Filled Prompt
```
You are a Prompt Template Normalization Assistant.

Input:
- [SOURCE_FILES]: .github/agents/*.agent.md, .github/skills/*/SKILL.md
- [TARGET_MODE]: overwrite
- [DOMAIN_CONTEXT]: PF Evatec QA automation and documentation

Context:
- [TEMPLATE_STANDARD]: Enforce exact headings and section order
- [QUALITY_RULES]: Keep intent, improve clarity, preserve domain logic

Requirements:
- Normalize each source file to the required template format
- Keep unknown values as placeholders in [BRACKETS]
- Preserve critical constraints and behavior from the original prompt
- Include examples and troubleshooting guidance
- Provide a per-file change summary and assumptions list

Please provide:
- Normalized prompt file content for each input file
- Validation checklist confirming all required template sections are present
- Assumptions and unresolved gaps for each file
```

### Expected AI Response
```
Normalized Files:
- .github/agents/pf-qa-estimation.agent.md
- .github/skills/pf-cr-analysis/SKILL.md
...

Validation:
- All required sections present: PASS
- Placeholders preserved where inputs missing: PASS

Assumptions:
- Difficulty inferred from task complexity
- Related links kept as placeholders when unknown
```

## Expected Output

The AI should provide:
1. Fully normalized prompt files matching the required section structure.
2. A concise change summary for each processed file.
3. A compliance checklist and assumptions list.

**Quality Indicators**:
- [ ] Output is complete and addresses all requirements
- [ ] Code/content follows best practices
- [ ] Examples are included where appropriate
- [ ] Edge cases are considered

## Related Prompts

- [Prompt Metadata Refiner](../prompts/prompt-metadata-refiner.md) - Improves metadata consistency.
- [Prompt Quality Reviewer](../prompts/prompt-quality-reviewer.md) - Reviews prompt quality and gaps.
- [Prompt Library Indexer](../prompts/prompt-library-indexer.md) - Creates prompt catalog entries.

## Additional Resources

- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) - Markdown syntax fundamentals.
- [Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering) - Prompt design practices.
- [Microsoft Writing Style Guide](https://learn.microsoft.com/style-guide/welcome/) - Clear technical writing guidance.

## Tips for Best Results

1. **Be Specific**: Include exact file paths and intended audience.
2. **Iterate**: Run normalization, then run a review pass.
3. **Validate**: Check every required heading in final output.
4. **Customize**: Keep domain-specific terms from the source prompts.

## Troubleshooting

**Issue**: AI output is too generic
- **Solution**: Provide more specific context in [DOMAIN_CONTEXT]

**Issue**: Missing important details
- **Solution**: Add additional requirements or constraints

**Issue**: Output doesn't match expected format
- **Solution**: Specify the exact format in the prompt template

---

**Note**: Always review and validate AI-generated content before using in production environments.
