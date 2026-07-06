---
mode: agent
tools: ['codebase', 'githubRepo']
description: 'Generate comprehensive API documentation from source code and existing tests.'
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Purpose

Generate complete API documentation by analyzing source code, contracts, models, validators, tests, and related configuration files.

# Goal

Produce accurate, production-ready API documentation that can be used by:

- Developers
- QA engineers
- API consumers
- Integration teams
- Technical writers
- Product owners

The generated documentation must be based on repository evidence and never rely on assumptions.

# Inputs

Focus endpoint(s):

${input:endpoint_focus:Which endpoint, controller, service, or API area should be documented?}

Documentation depth:

${input:doc_depth:summary|detailed|full-reference}

# Instructions

Analyze the codebase and identify:

- Controllers
- Endpoints
- Route attributes
- Request DTOs
- Response DTOs
- Validation rules
- Authentication requirements
- Authorization requirements
- Error handling logic
- Business rules
- Related unit tests
- Related integration tests

Gather evidence before generating documentation.

If information cannot be determined from the codebase, explicitly state:

"Not determined from available repository evidence."

Do not invent:

- Parameters
- Return values
- Status codes
- Security requirements
- Validation rules

# Required Analysis

## API Discovery

Identify:

- HTTP methods
- Routes
- Endpoint purpose
- Tags or functional areas

## Request Analysis

Document:

- Request body schema
- Path parameters
- Query parameters
- Header requirements
- Required fields
- Optional fields
- Validation constraints

## Response Analysis

Document:

- Success responses
- Error responses
- Response DTOs
- Response examples

## Security Analysis

Document:

- Authentication mechanisms
- Authorization requirements
- Required claims
- Required roles
- Required permissions

## Business Logic Analysis

Identify:

- Business rules
- Validation workflows
- Side effects
- Dependencies
- Integration points

## Testing Coverage Analysis

Identify:

- Existing unit tests
- Existing integration tests
- Existing contract tests
- Missing coverage areas

# Output Format

# API Documentation

## Endpoint Summary

| Method | Route | Purpose |
|---|---|---|
| ... | ... | ... |

## Overview

Describe the endpoint purpose and expected behavior.

## Authentication

- ...

## Authorization

- ...

## Request

### Headers

| Header | Required | Description |
|---|---|---|
| ... | ... | ... |

### Path Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| ... | ... | ... | ... |

### Query Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| ... | ... | ... | ... |

### Request Body

```json
{
}
```

### Validation Rules

- ...

## Responses

### Success Responses

#### 200 OK

```json
{
}
```

#### 201 Created

```json
{
}
```

### Error Responses

#### 400 Bad Request

```json
{
}
```

#### 401 Unauthorized

```json
{
}
```

#### 403 Forbidden

```json
{
}
```

#### 404 Not Found

```json
{
}
```

#### 500 Internal Server Error

```json
{
}
```

## Business Rules

- ...

## Dependencies

- Databases
- External APIs
- Services
- Queues
- Storage providers

## Testing Coverage

### Existing Coverage

- ...

### Missing Coverage

- ...

### Recommended Tests

- ...

## OpenAPI 3.0 Specification

Generate a complete OpenAPI 3.0.3 YAML specification based on repository evidence.

```yaml
openapi: 3.0.3
...
```

## Consumer Notes

- Usage guidance
- Common pitfalls
- Integration considerations

# Quality Requirements

- Use repository evidence only.
- Produce valid OpenAPI 3.0.3 YAML.
- Include realistic examples.
- Reuse schemas where possible.
- Highlight undocumented behavior.
- Highlight missing validations.
- Highlight testing gaps.
- Highlight security concerns.
- Be suitable for Swagger UI and Postman import.

# Recommended Companion Instruction File

`.github/instructions/api-documentation.instructions.md`

# API Documentation Standards

When documenting APIs:

- Gather repository evidence first.
- Never invent endpoint behavior.
- Review controllers, DTOs, validators, and tests.
- Prefer business-focused descriptions.
- Include authentication and authorization requirements.
- Include validation rules.
- Include request and response examples.
- Identify missing tests.
- Generate OpenAPI 3.0.3 compliant output.
- Highlight undocumented behavior.
- Clearly distinguish confirmed behavior from assumptions.