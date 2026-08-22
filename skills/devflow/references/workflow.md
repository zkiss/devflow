# Workflow and task lifecycle

## State model

A **Deliverable** is one user-requested outcome intended to be accepted and shipped as a unit, such
as one pull request or Jira ticket. One ledger holds the semi-persistent working memory for exactly one
Deliverable so a new agent can continue the loop without conversational context.

The reserved `deliverable` task records the complete request and later stamps the final combined
candidate. A **work task** is a coherent implementation increment toward that Deliverable.

The ledger is the source of truth for workflow state and agent handoffs. Git is the source of truth
for implementation state. Preserve decisions, evidence, failures, and outcomes in the ledger
through `ratchet` rather than relying on an agent's memory.

## Lifecycle

1. Resume the ledger for the same Deliverable, create one when none exists, or replace an old
   ledger when the active protocol authorizes it.
2. For a new ledger, record the user's full outcome in `deliverable`.
3. Plan one or more work tasks. Tasks may be created upfront or whenever required work is
   discovered outside every existing task.
4. Process work tasks one at a time. Implement and advance a candidate, verify it, review it, and
   correct it until its current gate and review both pass with no open questions. Then complete it
   before implementing the next work task.
5. After all work tasks are complete, advance `deliverable` at the combined HEAD and review the
   entire requested outcome holistically.
6. Run full verification. After any final failure, correct it, advance again, rerun full
   verification, then repeat the holistic review. Continue until both checks pass at the same
   commit.
7. Report the result and material user-facing context. Retain the completed ledger until it is
   deliberately replaced for the next Deliverable.

An advance makes earlier gate and review results for that task stale. Completion is explicit. Any
authorized override must record why normal blockers do not apply.

## Choosing the next action

- unclear scope or decomposition: plan;
- open question: investigate or obtain user judgment;
- missing implementation or failed gate or review: implement or correct;
- missing or stale gate: verify;
- missing or stale review: review;
- current gate pass, current review pass, and no open questions: complete.

Correct forward. Keep completed tasks and historical entries immutable. A newly discovered
increment belongs in a new task; after it completes, repeat holistic assurance for the Deliverable.
