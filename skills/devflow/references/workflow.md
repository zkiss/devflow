# Workflow and task lifecycle

## State model

A **branch goal** is the overall user-requested outcome intended to be accepted and shipped as a
unit, such as one pull request or Jira ticket. One ledger holds the working memory for that goal,
including follow-up adjustments, so a new agent can continue without conversational context.

A **Deliverable checkpoint** is an independently assured version of the cumulative branch outcome.
Checkpoint tasks use consecutive IDs `deliverable-1`, `deliverable-2`, and so on. The first records
the initial goal; each later checkpoint records an adjustment and identifies its predecessor.

A **work task** is one independently assured increment owned by a checkpoint. Its ID uses that
checkpoint's prefix, such as `d2-validation`, and its definition names the owning checkpoint.
Work tasks are optional: a coherent checkpoint can own its implementation directly.

The ledger is the source of truth for workflow state and agent handoffs. Git is the source of truth
for implementation state. The ledger contains the durable decisions, evidence, failures, and
outcomes needed to continue without an agent's memory.

## Lifecycle invariants

- A ledger belongs to exactly one branch goal. It retains completed checkpoints and their history
  when that goal receives follow-up work. Replacement requires authorization from the active
  protocol for a different goal.
- A new ledger contains the user's full outcome in `deliverable-1` before planning.
- At most one checkpoint is active. A related follow-up after completion creates the next
  checkpoint; a refinement while a checkpoint is active extends that checkpoint's recorded scope.
- At most one task undergoes implementation or assurance at a time. A blocked task may be
  suspended while another dependency-safe task progresses. Suspension does not complete the
  blocked task, and a suspended candidate does not undergo assurance.
- A task is complete only when its latest candidate has a current passing gate, a current passing
  review, and no open questions.
- A scope refinement requires implementation reassessment and a later advance before assurance or
  completion; earlier results do not certify the refined outcome.
- After the prerequisite tasks identified by a scope-gap answer are complete, the suspended task
  returns to implementation and records a later advance before assurance.
- A checkpoint follows the same plan, implementation, assurance, and completion lifecycle as any
  other task. Any work-task prerequisites complete before checkpoint implementation.
- Final assurance begins after the checkpoint records its implementation advance, which stamps
  the combined HEAD whether or not work tasks were needed.
- A correction after a final failure produces another checkpoint advance. Both assurance results
  must pass at that same commit before the checkpoint is complete.
- A completed checkpoint establishes the cumulative outcome at its stamped commit. Completion
  ends that assurance cycle, not the ledger's lifetime.

Completion is explicit. Any authorized override records why normal blockers do not apply.

Corrections append new events; completed tasks and historical entries remain immutable. Completing
any work task owned by the active checkpoint after its combined advance makes another combined
advance and holistic assurance pass necessary.
