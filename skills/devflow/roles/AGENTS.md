# Role definitions

Each Markdown file in this directory is the complete protocol for one Devflow role.

Keep these concerns in the role definition:

- purpose and responsibilities;
- allowed, required, and prohibited actions;
- context-reading limits;
- required routing identifiers and dispatch choices;
- commands and where they run;
- exceptional authority; and
- response and handoff contracts.

Name only the shared skill references the role needs. Mention the first required CLI command at the
point where the role uses it, while leaving general CLI semantics and help discovery in the shared
topic reference.

Do not move role-specific instructions into a shared reference merely to avoid repetition. If a
rule applies unchanged to every reader of a topic, move it to that topic and remove local copies.

Harness-specific model, reasoning, sandbox, and adapter metadata does not belong here; keep it in
the corresponding `agents/<harness>/` definition.
