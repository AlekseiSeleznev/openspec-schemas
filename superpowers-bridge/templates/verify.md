# Verification Report

> This file is produced by the `openspec-verify-change` skill after apply
> completes. It checks implementation consistency with specs, design, and
> tasks. Failed checks must route back to the relevant artifact, then verify
> must be rerun.

**Change**: `<change-name>`
**Verified at**: `YYYY-MM-DD HH:mm`
**Verifier**: `<who / which agent>`

---

## 1. Structural Validation (`openspec validate --all --json`)

- [ ] All items have `"valid": true`

**Result**:

```text
<paste summary of openspec validate --all output>
```

If any item failed, list id + issues:

| Item | Type | Issues |
|---|---|---|
| - | - | - |

---

## 2. Task Completion (`tasks.md`)

- [ ] Every `- [ ]` checkbox has become `- [x]`

**Incomplete tasks**:

| Task | Reason incomplete | Blocks archive? |
|---|---|---|
| - | - | - |

---

## 3. Delta Spec Sync State

For each capability directory under `openspec/changes/<name>/specs/`, compare
with `openspec/specs/<capability>/spec.md`:

| Capability | Sync state | Notes |
|---|---|---|
| - | already synced / needs sync / N/A | - |

---

## 4. Design / Specs Coherence Spot Check

Spot-check whether decisions in `design.md` are reflected in Requirements and
Scenarios under `specs/*.md`:

| Sample | design description | specs mapping | Gap |
|---|---|---|---|
| - | - | - | - |

**Drift warnings**:

- <list warnings, or write "none">

---

## 5. Implementation Signal

- [ ] Worktree has no unstaged files
- [ ] All relevant commits are pushed

**Commit range**: `<from-sha>..<to-sha>`

---

## 6. Front-Door Routing Leak Detector (warning, non-blocking)

Design output should not land in `docs/superpowers/specs/`. The brainstorm
artifact output redirection should route it to
`openspec/changes/<name>/brainstorm.md`.

Detect:

```bash
ls docs/superpowers/specs/*.md 2>/dev/null
```

- [ ] No files exist, or existing files legitimately predate schema installation

**Leak list**:

| File | Captured into change? | Suggested action |
|---|---|---|
| - | - | - |

> This does not block archive. A leak produced by a new schema-installed cycle
> should be moved into `openspec/changes/<name>/brainstorm.md` or `design.md`,
> then the leaked file should be deleted after capture is confirmed.

---

## 7. Deferred Manual Dogfood vs Automated Test Equivalence

For each manual dogfood / smoke task in `plan.md` marked `[~]` deferred, list
the equivalent automated test coverage. If no equivalent automated test exists,
that row is a real gap rather than a justified deferral; record it in
retrospective Misses.

| Deferred dogfood (plan section) | Equivalent automated test | Coverage assessment | Real gap? |
|---|---|---|---|
| Example: §11.3 `compose up + curl /actuator/health` | `LinebcIntegrationApplicationTests` (Testcontainers, 24s) | Spring context boot + Flyway completed + main bean wiring | no, equivalent coverage |
| - | - | - | - |

Interpretation rules:

- Equivalent means the automated assertions are a superset of the expected manual dogfood assertions.
- Coverage assessment lists the real touched layers: context, DB schema, wiring, HTTP path, etc.
- Any row with `Real gap? = yes` may still allow Overall Decision PASS, but must leave a retrospective follow-up.
- If `plan.md` has no `[~]` rows, this section may stay empty and still PASS.
- If `plan.md` has any `[~]` rows and this section is empty, Overall Decision should be FAIL because gap analysis was skipped.

---

## Overall Decision

- [ ] PASS - proceed to `finishing-a-development-branch` and archive
- [ ] PASS WITH WARNINGS - proceed, but note: `<explanation>`
- [ ] FAIL - return to the failed artifact, fix, and rerun verify

**Next step**:

<describe next action>
