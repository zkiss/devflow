# Documentation ownership

Protect agent context by giving each fact one owner:

- `skills/devflow/roles/` owns behavior that varies by Devflow role.
- `skills/devflow/references/` owns shared knowledge about the workflow and its domains.
- `agents/<harness>/` owns harness-specific adapter metadata, model profiles, and the pointer to
  the canonical role.

Put responsibilities, permissions, prohibitions, context limits, commands, routing decisions, and
response contracts in the relevant role definition. Put definitions, state models, semantics, and
invariants in the relevant shared topic only when they apply independently of role. Keep harness
adapter files shallow; they must not duplicate protocol instructions.

Move misplaced knowledge instead of copying it. A concrete agent should load the `devflow` skill,
follow exactly one role, and let that role name only the references it requires.
