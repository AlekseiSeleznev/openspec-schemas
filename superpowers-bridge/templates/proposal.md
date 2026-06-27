## Why

<!--
Explain the motivation for this change. What problem does this solve? Why now?
Prefer brainstorm.md §OpenSpec Capture Summary when present; use the raw capture
only to resolve missing rationale.
If brainstorm.md does not show a closed Clarification Gate, or if any
blocking TBD remains, stop and return to brainstorm instead of writing
proposal.md.

Hard limit: 50 <= character count <= 1000. OpenSpec zod schema validates this.
- Too short: `Why section must be at least 50 characters`
- Too long: `Why section should not exceed 1000 characters`

Suggested structure: current pain -> why now -> expected benefit, 1-2 sentences each.
-->

## What Changes

<!--
Describe what will change. Be specific about new capabilities, modifications, or removals.
Base this on Resolved Decisions, Rejected Alternatives, Risks / Trade-offs, and
Validated Direction from brainstorm.md §OpenSpec Capture Summary.

For behavior changes with a clear before/after shape, use From/To format
(Markdown has no inline diff):

**<Section or Behavior Name>**
- From: <current state / requirement>
- To: <future state / requirement>
- Reason: <why this change is needed>
- Impact: <breaking / non-breaking, who's affected>

Repeat this block for multiple changes. Pure additions or removals may use a concise list.
-->

## Capabilities

### New Capabilities
<!--
Capabilities being introduced. Replace <name> with a kebab-case identifier.
Use compound names with at least two words, for example `user-auth`,
`data-export`, or `api-rate-limiting`; avoid one-word names.
Each item creates specs/<name>/spec.md.
-->
- `<name>`: <brief description of what this capability covers>

### Modified Capabilities
<!--
Existing capabilities whose REQUIREMENTS are changing (not just implementation).
Only list here if spec-level behavior changes. Each needs a delta spec file.
Use existing spec names from openspec/specs/. Leave empty if no requirement changes.
-->
- `<existing-name>`: <what requirement is changing>

## Impact

<!-- Affected code, APIs, dependencies, systems -->
