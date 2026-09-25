---
name: devflow
description: Provides the canonical Devflow roles and shared references for one loop managed through `ratchet`. Use only when the active agent adapter requires this skill.
user-invocable: false
---

# Devflow

The active harness adapter names exactly one role under `roles/`. Follow that role as the canonical
agent protocol. The role names every shared topic it requires from the lookup table below.

## Roles

| Role | Definition |
| --- | --- |
| Runner | [roles/runner.md](roles/runner.md) |
| Planner | [roles/planner.md](roles/planner.md) |
| Worker | [roles/worker.md](roles/worker.md) |
| Reviewer | [roles/reviewer.md](roles/reviewer.md) |
| Verifier | [roles/verifier.md](roles/verifier.md) |
| Analyst | [roles/analyst.md](roles/analyst.md) |

## Shared references

After reading the active role, load the reference for each topic explicitly named in its
**Required reference loading** section. Load no other references from this skill. Do not infer
additional topics from the assigned task, the role, or the topic names below.

| Topic | Reference |
| --- | --- |
| Workflow and task lifecycle | [references/workflow.md](references/workflow.md) |
| `ratchet` operations | [references/ratchet.md](references/ratchet.md) |
| Delegation protocol | [references/delegation.md](references/delegation.md) |
| Git and stamped evidence | [references/git-stamps.md](references/git-stamps.md) |
| Scope and questions | [references/scope-questions.md](references/scope-questions.md) |
| Assurance | [references/assurance.md](references/assurance.md) |
