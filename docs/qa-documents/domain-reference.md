# Domain Reference

## Predefined Types

Predefined Types are required for creating and managing key entities (for example boxes, modules, and tool-related types).

Guidelines:

- Seeded values should generally not be modified unless necessary.
- Add or edit values only with appropriate permissions.

Typical rights needed:

- PredefinedValue_View
- PredefinedValue_Edit

## Boxes

Boxes are used to organize and track substrates during operations.

Capabilities include:

- Create/edit boxes
- Print labels
- Upload documents
- Remove boxes through controlled reasons (scrap/reclaim/ship/use as dummies)

Typical rights needed:

- Boxes_View
- Boxes_Edit (for mutations)

## Substrates

Substrates are created/associated through box workflows and tracked across processing and metrology stages.

Common actions:

- View substrate history
- Stage matching review and execution
- Add to collections
- Export substrate information

Typical rights needed:

- Substrates_View

## Stage Matching Summary

- Stage matching can be automatic or manual.
- Process tools and metrology sequences shape stage grouping.
- Matching can be run on selected substrates or collection-based sets.

Core precondition:

- Substrates must have meaningful processing and/or measurement history available.
