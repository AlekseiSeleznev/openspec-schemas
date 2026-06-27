# Retrospective: <change-name>

> Written: <YYYY-MM-DD> (after verify passed)
> Commit range: `<base-sha>..<head-sha>`
> Worktree: <path or "merged to main">

---

## 0. Evidence

> Quantitative front matter. Later Wins / Misses bullets should reference this
> section instead of repeating `[evidence: ...]` on every line.
> If the retro is written cold after the cycle, `git log`, `tasks.md`, and
> commit messages should still be enough to reconstruct this section.

- **Commit range**: `<base-sha>..<head-sha>` (<n> commits)
- **Diff size**: <+X / -Y lines across N files>
- **Tasks done**: <x>/<y> (`grep -cE '^\s*- \[x\]' tasks.md` -> x; regex allows indented subtasks)
- **Active hours**: <estimate>
- **Subagent dispatches**: <count or "n/a">
- **New external dependencies**: <list, with license + version, or "none">
- **Bugs encountered post-merge**: <count, one-line each, or "none">
- **OpenSpec validate state at archive**: <pass / fail / not-run>
- **Test coverage signal**: <e.g. jacoco %, pytest count, vitest count, or "n/a">

Commit chain (chronological):

```text
<base-sha> <one-line summary>
...
<head-sha> <archive commit one-line>
```

---

## 1. Wins

- [evidence: <commit/file/test>] <description>

## 2. Misses

- [blocking | evidence: ...] <description>
- [painful  | evidence: ...] <description>
- [nit      | evidence: ...] <description>

## 3. Plan deviations

| Plan task | What changed | Why |
|---|---|---|
| 1.2 | ... | ... |

## 4. Skill / workflow compliance

| Skill | Used |
|---|---|
| superpowers:brainstorming | |
| superpowers:writing-plans | |
| superpowers:using-git-worktrees | |
| superpowers:subagent-driven-development | |
| (transitive) superpowers:test-driven-development | |
| (transitive) superpowers:requesting-code-review | |
| superpowers:finishing-a-development-branch | |

Default expectation: every row is marked used. Each skill is part of the
schema design; skipping one is exceptional. Any skipped skill must be explained
in `### Deliberately Skipped Skills`.

### Deliberately Skipped Skills

Skipping a skill is an escape hatch, not the normal path. For every skipped row,
answer all three questions below. If every row above is used, leave this section
empty.

- **`<skill name>`**
  - **What was skipped**: <specific skill or sub-step>
  - **Why this cycle**: <concrete trigger in this cycle; avoid vague reasons like "not needed", "too small", "no time", "blocked by external dep", or "skill output looked wrong">
  - **How to prevent recurrence**: choose one and be specific:
    - `schema graph fix` - exact schema.yaml section to change
    - `skill description tightening` - exact skill frontmatter/instruction to change
    - `CLAUDE.md trigger` - exact routing rule to add to adopter CLAUDE.md.fragment
    - `scope-judgment rule` - how this cycle's scope should be classified next time
    - `one-off - schema boundary case, no prevention possible` - explain why this is a true boundary case

If several cycles skip the same skill with the same prevention answer, promote
that pattern to section 6 and trigger a schema / skill PR instead of normalizing
the skip.

## 5. Surprises

- <assumption that turned out wrong>

## 6. Promote candidates -> long-term learning

Use a `- [ ]` checklist for each candidate:

- Title: severity label (`blocking` / `painful` / `nit`) + one-sentence learning
- `-> **Promote to** <destination>` (memory / CLAUDE.md / schema / skill / one-off)
- Two body lines matching the feedback memory body schema:
  - `> **Why**: <reason; often a past incident or strong preference>`
  - `> **How to apply**: <when/where this guidance kicks in>`

Unchecked `- [ ]` items are candidates not yet promoted. Carry them into the
next cycle retro for re-evaluation, or keep them as cross-cycle observations.

Carry-forward mechanism: in the next retro, use
`grep -A 5 '^- \[ \]' openspec/changes/archive/*/retrospective.md` to inspect
older unchecked candidates and decide whether to carry forward, promote, or
mark stale.

Examples:

- [ ] **<short rule>** -> **Promote to memory** (type: feedback)
  > **Why**: <past incident or strong preference that motivated this rule>
  > **How to apply**: <which file / cycle phase / decision moment this kicks in>

- [ ] **<another candidate>** -> **Promote to project CLAUDE.md** (`<path/to/CLAUDE.md>` section)
  > **Why**: ...
  > **How to apply**: ...

- [ ] **<third candidate>** -> **One-off** (record only, do not promote)
  > **Why**: <why it does not generalize>
