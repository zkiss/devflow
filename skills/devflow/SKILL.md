---
name: devflow
description: Provides shared references for one Devflow loop managed through `ratchet`. Use only when the active agent definition requires this skill, and load only the topics it names.
user-invocable: false
---

# Devflow shared references

The active Devflow agent definition is the sole loading protocol for this skill.
It names every shared topic required by that agent.

After reading this file, load the reference for each topic explicitly named in the agent
definition's **Required skill loading** section.
Load no other references from this skill.
Do not infer additional topics from the assigned task, the agent's role, or the topic names below.

| Topic | Reference |
| --- | --- |
| Workflow and task lifecycle | [references/workflow.md](references/workflow.md) |
| `ratchet` operations | [references/ratchet.md](references/ratchet.md) |
| Delegation protocol | [references/delegation.md](references/delegation.md) |
| Git and stamped evidence | [references/git-stamps.md](references/git-stamps.md) |
| Scope and questions | [references/scope-questions.md](references/scope-questions.md) |
| Assurance | [references/assurance.md](references/assurance.md) |
