# Delegation protocol

A handoff separates two kinds of input:

- the ledger holds complete durable work context;
- the dispatch identifies one task and immediate action, plus any required secondary ID.

Record task requirements, decisions, questions, implementation advances, assurance findings, and
other reusable context in the ledger before the handoff. Keep the dispatch to the minimum text
needed to select the action; do not copy durable context into it.

The dispatch determines which action to perform. The task definition and relevant later events
determine the current expected outcome. Resolve any material conflict between them rather than
guessing.

Substantive results belong in the ledger so subsequent work can proceed from recorded state rather
than conversational memory.
