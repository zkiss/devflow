# Devflow skill

This skill supplies role-independent knowledge with minimal context loading.

`SKILL.md` is an index and loading contract. It maps topic names to references; it does not define
concrete role behavior. Each file in `references/` owns one domain topic and includes only
definitions, semantics, invariants, and protocols that remain true regardless of which role reads
it.

Shared references do not contain:

- concrete Devflow role names;
- per-role permissions, prohibitions, or context limits;
- role-specific commands or routing decisions;
- exceptional authority; or
- response contracts.

The delegation topic may use generic participant terms such as caller, recipient, or specialist
when the relationship itself is the subject. Concrete role exceptions and required identifiers
belong in the relevant agent definitions.

Do not copy installed CLI help into a reference. State stable semantics and direct readers to the
installed help for current syntax, options, and limits.
