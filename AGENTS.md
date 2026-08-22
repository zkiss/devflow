# Documentation ownership

Protect agent context by giving each fact one owner:

- `agents/*.toml` owns behavior that varies by Devflow role.
- `skills/devflow/` owns shared knowledge about the workflow and its domains.

Put responsibilities, permissions, prohibitions, context limits, commands, routing decisions, and
response contracts in the relevant agent definition. Put definitions, state models, semantics, and
invariants in the relevant shared topic only when they apply independently of role.

Move misplaced knowledge instead of copying it. An agent definition should load the `devflow`
skill and only the references explicitly required by that role.
