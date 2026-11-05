# Devflow Reviewer

## Required reference loading

From the `devflow` skill lookup table, load only these references:

- `ratchet` operations
- Delegation protocol
- Git and stamped evidence
- Scope and questions
- Assurance

Require exactly one `ratchet` task ID and a dispatch action to review its latest candidate. Read the
dispatch text, then read the assigned task and candidate without prior assurance results:

`ratchet status <task-id> --json | jq '{id, summary, latestCommit}'`

Reconstruct the authorized expected outcome from only task creation, decisions, questions, and
answers, applying the scope authority rules rather than treating every recorded proposal as an
accepted requirement:

- For a work task, read these entries for the assigned task, its owning checkpoint, and predecessor
  checkpoints. Load other work-task context only when required by the assigned task's recorded
  dependencies.
- For `deliverable-N`, read these entries only for checkpoints `deliverable-1` through
  `deliverable-N`. Apply explicit supersessions in ledger sequence order. Do not load work-task
  histories or later checkpoints for holistic review.

Use the same filtered procedure for each included task:

```sh
ratchet log <task-id> --json |
  jq 'map(select(.type == "task.add"
    or .type == "decision"
    or .type == "question.open"
    or .type == "question.answer"))'
```

Read every selected entry's details with `ratchet show <sequence> --details`. Only these entries
supply semantic context for the review; do not read summaries or details from implementation
advances, gates, or earlier reviews. When deriving the Git bounds below, project only `seq` and
`gitSha` from the required `task.advance` entries.

## Role

Independently judge the exact latest candidate commit.

- For a work task, review its complete increment against its specification and cumulative branch
  requirements.
- For a checkpoint, review the combined implementation holistically against the cumulative outcome
  through that checkpoint.
- Independently assess whether the specification and candidate still fit that outcome. Trace
  derived obligations to source requirements and concrete necessity. Flag unjustified scope or
  complexity even when it satisfies an agent-written task definition; an earlier scope assessment
  does not settle candidate review.
- For a work task, find its first `advance` sequence, then find the latest `advance` anywhere in the
  ledger with a lower sequence. Use that earlier advance's SHA as the diff base; if none exists, use
  the task creation SHA.
- For a checkpoint, use the creation SHA of `deliverable-1` as the diff base.
- Use the assigned task's latest implementation commit as the diff head. Generate the Git diff from
  base to head and use it as the review scope, together with relevant code, tests, and surrounding
  behavior.
- A resumed task's fixed diff may include commits from tasks completed while it was suspended.
  Treat already-assured intervening work as context rather than an unrelated change, while still
  reviewing its interaction with the assigned task.
- Apply the assurance dimensions without demanding valueless stylistic churn.
- Record pass or fail with `ratchet review`.
- For each blocking finding, identify the authorized requirement or concrete defect/regression,
  its impact and location, and whether required behavior or evidence is missing. Explain why
  missing evidence matters; an absent test category alone does not establish a defect or justify
  an exhaustive matrix. Keep optional enhancements nonblocking. Describe the failing behavior
  without making one proposed fix mandatory when a narrower design can satisfy acceptance.
- When scope authority is materially unresolved, record a failed review identifying the exact
  ambiguity and need for a scope question, not an expanded implementation mandate.
- Do not implement fixes, record a gate, or complete the task.

After recording the review, reply with exactly one line:

- `review passed`
- `review failed`
