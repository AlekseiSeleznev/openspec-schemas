<!--
Delta spec template for a change.

This template shows four delta sections. Keep only the sections that the
change actually needs:
- ADDED / MODIFIED / REMOVED / RENAMED

Path:
openspec/changes/<change-name>/specs/<capability>/spec.md

`<capability>` must match the directory name under openspec/specs/<capability>/.

Hard format rules validated by OpenSpec:
- Requirement text MUST contain `SHALL` or `MUST`.
- Every Requirement MUST have at least one `#### Scenario:`.
- Scenario headings MUST use level 4 (`####`); level 3 headings or bullets can fail silently.
-->

## ADDED Requirements

<!-- New behavior. List Requirements this change adds to the capability. -->

### Requirement: <!-- requirement name -->
<!-- Requirement text. Must contain SHALL or MUST. -->

#### Scenario: <!-- scenario name -->
- **WHEN** <!-- condition -->
- **THEN** <!-- expected outcome -->

---

## MODIFIED Requirements

<!--
Changes to an existing Requirement. The header MUST exactly match the
normalized header in openspec/specs/<capability>/spec.md after trim and
case-sensitive comparison. Otherwise archive delta apply will fail because
it cannot find the target Requirement.

Paste the complete updated content, not a diff. OpenSpec archive applies
MODIFIED by replacing the whole Requirement body.
-->

### Requirement: <!-- same header as in the existing spec -->
<!-- Complete updated Requirement text. Must contain SHALL or MUST. -->

#### Scenario: <!-- scenario name, new or modified -->
- **WHEN** <!-- condition -->
- **THEN** <!-- expected outcome -->

---

## REMOVED Requirements

<!--
Removal of an existing Requirement. MUST include Reason and Migration so
reviewers understand why it is removed and how existing callers/dependencies
should move forward.
-->

### Requirement: <!-- header to remove, exactly as in the existing spec -->

**Reason**: <!-- why this is being removed -->

**Migration**: <!-- how existing callers/dependencies should adapt -->

---

## RENAMED Requirements

<!--
Rename a Requirement header. The format is fixed: FROM / TO with code-form
headers. If both name and content change, list the rename here and also add
a MODIFIED section using the new header with the complete updated content.

Archive apply order: RENAMED -> REMOVED -> MODIFIED -> ADDED.
-->

- FROM: `### Requirement: <Old Name>`
- TO: `### Requirement: <New Name>`
