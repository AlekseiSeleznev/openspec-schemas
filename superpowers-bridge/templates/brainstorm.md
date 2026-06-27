<!--
Raw capture of superpowers:brainstorming output, followed by the
schema-owned OpenSpec Capture Summary.

Сначала зафиксируйте естественный output brainstorming skill без
принудительной структуры raw capture. Обычно это decision log:
background -> decision chain Q1-Qn -> design trade-offs, но конкретная
организация зависит от разговора.

Raw capture должен пройти domain-modeling / grilling hardening:
укажите domain terms, identities, lifecycle states, invariants, edge
cases, unresolved design forks, recommended answers, trade-offs и
evidence, проверенный до принятия assumptions.

Brainstorm нельзя завершать, пока Clarification Gate ниже не закрыт.
Если scope, domain model, design forks, capabilities, acceptance criteria
или user-approved direction остаются неясными, продолжайте задавать по
одному прямому вопросу и не создавайте этот artifact.

После raw capture добавьте OpenSpec Capture Summary ниже. Это стабильная
передача контекста в proposal.md и design.md.

design.md извлекает и переорганизует решения из этого файла в
структурированный design document.

Не копируйте brainstorm.md в design.md дословно. design.md - отдельная
реконструкция, эти файлы дополняют друг друга, но не дублируют.
-->

## OpenSpec Capture Summary

### Clarification Gate

| Check | Status | Evidence |
|---|---|---|
| Scope locked | yes | |
| Domain model clear | yes | |
| Major design forks resolved | yes | |
| Capabilities identifiable | yes | |
| Acceptance criteria stateable | yes | |
| Blocking TBDs remaining | none | |
| User-approved direction | yes | |

<!--
All Status values above must be `yes`, except Blocking TBDs remaining,
which must be `none`. If this is not true, brainstorm is not complete.
-->

### Evidence Checked

<!-- Project files, official docs, MCP/tool lookups, commands, or other sources used to avoid guessing. -->

### Domain Model

<!-- Terms, identities, ownership boundaries, lifecycle states, invariants, edge cases, and glossary conflicts. -->

### Grilling Decision Tree

<!-- Key questions asked, recommended answers, chosen answers, and trade-offs. -->

### Resolved Decisions

<!-- Decisions ready for proposal.md and design.md. -->

### Rejected Alternatives

<!-- Options considered and why rejected. -->

### Risks / Trade-offs

<!-- Risks, mitigations, and accepted costs. -->

### Non-Blocking TBDs

<!--
Use "None" when empty. Otherwise list each remaining unknown with owner,
impact scope, why it does not block proposal/design/specs/tasks/plan/apply,
and blocking phase `none`.
-->

### Documentation Candidates

<!-- ADR, CONTEXT, runbook, or spec candidates to create later, if warranted. -->

### Validated Direction

<!-- One concise statement of the agreed approach plus acceptance criteria signal. -->
