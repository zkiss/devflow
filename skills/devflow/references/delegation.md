# Delegation protocol

A handoff separates two kinds of input:

- the ledger and its cited repository sources hold complete durable work context;
- the dispatch identifies one task and immediate action, plus any required secondary ID.

Record task requirements, decisions, questions, implementation advances, assurance findings, and
other reusable context or source references in the ledger before the handoff. Keep the dispatch to
the minimum text needed to select the action; do not copy durable context into it.

The dispatch determines which action to perform. The task definition, its cited repository sources,
and relevant later events determine the current expected outcome. Resolve any material conflict
between them rather than guessing.

Substantive results belong in the ledger so subsequent work can proceed from recorded state rather
than conversational memory.

## Error handling

Attempt trivial local recovery within the current role and action, such as correcting an evident
command invocation error using installed help. Recovery that needs investigation, changed scope,
additional authority, or repeated retries belongs to the runner's next-action decision.

When trivial recovery is unavailable or fails, preserve existing progress and return one line
instead of the role's normal outcome response:

`error: <failed operation>; <cause or unknown>; <recorded progress and remaining unrecorded state>`

Include enough state to reconcile partial work: relevant ledger entries, created tasks, unanswered
questions, uncommitted changes, or a commit lacking an advance. Record diagnostics in the ledger
when possible; if recording fails, report that failure in the response. Do not claim an outcome
whose required entry is missing.

An error response supplies recovery diagnostics, not implementation or assurance evidence. A
recorded task blocker or failed assurance result is a normal outcome, not an error handoff. The
runner decides how to proceed from recorded state and the reported diagnostics.

When ledger writes are unavailable, a recovery dispatch may carry the minimal transient failure
diagnostic needed to select the action. Durable context belongs in the ledger once writes resume.
