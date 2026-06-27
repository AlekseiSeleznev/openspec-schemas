#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_root="${TMPDIR:-/tmp}/openspec-schemas-order-test.$$"
change_name="order-probe"

cleanup() {
  rm -rf "$tmp_root"
}
trap cleanup EXIT

fail() {
  echo "FAIL: $*" >&2
  echo "Current artifact status:" >&2
  openspec status --change "$change_name" --json | jq '.artifacts' >&2
  exit 1
}

ready_ids() {
  openspec status --change "$change_name" --json \
    | jq -r '.artifacts[] | select(.status == "ready") | .id' \
    | paste -sd ',' -
}

assert_ready_only() {
  local phase="$1"
  local expected="$2"
  local actual

  actual="$(ready_ids)"
  if [[ "$actual" != "$expected" ]]; then
    fail "$phase: expected ready artifacts '$expected', got '${actual:-<none>}'"
  fi
}

mkdir -p "$tmp_root/openspec/schemas"
cp -R "$repo_root/superpowers-bridge" "$tmp_root/openspec/schemas/superpowers-bridge"
cd "$tmp_root"

openspec new change "$change_name" --schema superpowers-bridge >/dev/null

assert_ready_only "new change" "brainstorm"

brainstorm_instruction="$(openspec instructions brainstorm --change "$change_name" --json \
  | jq -r '.instruction')"
if ! grep -q "Clarification Gate" <<<"$brainstorm_instruction"; then
  fail "brainstorm instruction must require the Clarification Gate"
fi
if grep -q "explicitly opt to write brainstorm.md manually" <<<"$brainstorm_instruction"; then
  fail "brainstorm instruction must not offer manual fallback"
fi
proposal_instruction="$(openspec instructions proposal --change "$change_name" --json \
  | jq -r '.instruction')"
if ! grep -q "lacks a closed Clarification Gate" <<<"$proposal_instruction"; then
  fail "proposal instruction must stop on a missing Clarification Gate"
fi

cat > "openspec/changes/$change_name/brainstorm.md" <<'EOF'
# Brainstorm

## OpenSpec Capture Summary

### Clarification Gate

| Check | Status | Evidence |
|---|---|---|
| Scope locked | yes | Order-only fixture scope is fixed. |
| Domain model clear | yes | Artifact order is the only domain term. |
| Major design forks resolved | yes | Use schema requires edges. |
| Capabilities identifiable | yes | artifact-order |
| Acceptance criteria stateable | yes | Ready artifacts advance one at a time. |
| Blocking TBDs remaining | none | No blocker remains for this fixture. |
| User-approved direction | yes | Fixture represents accepted deterministic order. |

### Evidence Checked

- schema fixture copied from the repository under test.

### Domain Model

- Artifact order: deterministic sequence enforced by requires edges.

### Grilling Decision Tree

- Q: Can design unlock before proposal? A: No; proposal must precede design.

### Resolved Decisions

- Enforce proposal before design.

### Rejected Alternatives

- Parallel proposal/design after brainstorm.

### Risks / Trade-offs

- None for the order fixture.

### Non-Blocking TBDs

None.

### Documentation Candidates

None.

### Validated Direction

Deterministic artifact order.
EOF

assert_ready_only "after brainstorm" "proposal"

first_ready="$(openspec status --change "$change_name" --json \
  | jq -r '.artifacts[] | select(.status == "ready") | .id' \
  | head -n 1)"
if [[ "$first_ready" != "proposal" ]]; then
  fail "/opsx:continue first-ready selection would choose '$first_ready' before proposal"
fi

design_status="$(openspec status --change "$change_name" --json \
  | jq -r '.artifacts[] | select(.id == "design") | .status')"
if [[ "$design_status" != "blocked" ]]; then
  fail "design must remain blocked until proposal exists; got '$design_status'"
fi

cat > "openspec/changes/$change_name/proposal.md" <<'EOF'
# Proposal

## Why

The documented and enforced lifecycle must match.

## What Changes

- Enforce proposal before design.

## Capabilities

### New Capabilities

- artifact-order

### Modified Capabilities

- None

## Impact

- superpowers-bridge schema graph
EOF

assert_ready_only "after proposal" "design"

cat > "openspec/changes/$change_name/design.md" <<'EOF'
# Design

## Context

proposal.md scopes the change; brainstorm.md remains the decision source.
EOF

assert_ready_only "after proposal and design" "specs"

echo "PASS: superpowers-bridge artifact order is deterministic"
