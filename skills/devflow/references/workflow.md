# Workflow and task lifecycle

## State model

A **Deliverable** is one user-requested outcome intended to be accepted and shipped as a unit, such
as one pull request or Jira ticket. One ledger holds the semi-persistent working memory for exactly
one Deliverable so a new agent can continue the loop without conversational context.

The reserved `deliverable` task represents the Deliverable and later stamps the final combined
candidate. A **work task** is an independently assured task within that Deliverable.

The ledger is the source of truth for workflow state and agent handoffs. Git is the source of truth
for implementation state. The ledger contains the durable decisions, evidence, failures, and
outcomes needed to continue without an agent's memory.

## Lifecycle invariants

- A ledger belongs to exactly one Deliverable. It may be resumed for that Deliverable or replaced
  for another only when the active protocol authorizes replacement.
- A new ledger contains the user's full outcome in `deliverable` before work-task decomposition.
- At most one work task undergoes implementation or assurance at a time. A blocked task may be
  suspended while another dependency-safe task progresses. Suspension does not complete the
  blocked task, and a suspended candidate does not undergo assurance.
- A task is complete only when its latest candidate has a current passing gate, a current passing
  review, and no open questions.
- After the prerequisite tasks identified by a scope-gap answer are complete, the suspended task
  returns to implementation and records a later advance before assurance.
- Final assurance begins after every work task is complete. The `deliverable` advance stamps the
  combined HEAD.
- A correction after a final failure produces another `deliverable` advance. Both assurance
  results must pass at that same commit before the Deliverable is complete.
- A completed ledger remains available until it is deliberately replaced for the next
  Deliverable.

Completion is explicit. Any authorized override records why normal blockers do not apply.

Corrections append new events; completed tasks and historical entries remain immutable. Completing
any work task after a `deliverable` advance makes another combined advance and holistic assurance
pass necessary.
