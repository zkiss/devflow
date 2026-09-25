# Devflow skill

This skill contains the canonical Devflow role definitions and role-independent shared knowledge.

`SKILL.md` indexes both. Each file in `roles/` owns one role's responsibilities, permissions,
prohibitions, context limits, commands, routing decisions, exceptional authority, and response
contracts. Each file in `references/` owns one shared domain topic and includes only definitions,
semantics, invariants, and protocols that remain true regardless of which role reads it.

A harness adapter points at exactly one role. That role is the loading protocol for shared
references and should load only the topics it explicitly names.

Do not copy role instructions into harness adapters or shared references. If a rule applies
unchanged to every reader of a topic, move it to that topic and remove local copies.

Do not copy installed CLI help into a reference. State stable semantics and direct readers to the
installed help for current syntax, options, and limits.
