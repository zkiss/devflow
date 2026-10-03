# Scope and questions

## Outcome and increments

`deliverable-1` preserves the user's initial branch goal, acceptance expectations, constraints,
and supplied context. Each later checkpoint records the requested adjustment and its predecessor.
The expected outcome at a checkpoint is cumulative: the initial goal and recorded refinements
through that checkpoint. Earlier requirements and decisions remain applicable unless a later
entry explicitly supersedes them.

Checkpoint entries own branch-level requirements: acceptance criteria, constraints, and expected
user-visible behavior. Work-task entries own increment specifications and local implementation
decisions. A resolved work-task decision that changes the branch outcome must also be recorded on
the active checkpoint before holistic assurance. Checkpoint history is sufficient to reconstruct
the cumulative expected outcome without reading work-task histories.

Each work task names its owning checkpoint and describes one coherent increment toward that
outcome. Its required context may come from the task definition, later ledger events, and existing
repository files cited by repository-root-relative path. Existing repository context, including
specifications and documentation, is cited rather than copied. The definition contains the
task-specific objective, acceptance scenarios, boundaries, dependencies, and material constraints
not already supplied by those sources. Implementation detail appears only when the request or
established architecture requires it. Task IDs and summaries make dependency-safe execution order
visible.

Repository file references must be durable. In a Git repository, only files already tracked by Git
are eligible task references. A file earns its place in Git independently of a task: no file is
added or committed merely so a task can cite it. When generated output, logs, temporary files, or
other untracked artifacts contain necessary evidence, the ledger contains the relevant concise
diagnostics or a reproducible command instead of a reference to the artifact.

A valid decomposition is the smallest set of tasks that remains coherent and orderable. Required
work discovered outside every existing open task is a separate work task owned by the active
checkpoint; it is not silently absorbed or added by rewriting completed scope. Later adjustments
identify the earlier requirements or decisions they supersede.

A **scope gap** exists when required work outside the current task blocks it. Resolving the gap
determines whether that work belongs to another open task or requires a new task. The gap is
represented by a blocking question on the current task. Its summary identifies the gap as requiring
decomposition, and its details record the evidence, impact, and recommended next step. The answer
summary identifies the prerequisite task IDs, their dependency order, and when the blocked task can
resume.

## Questions

Question IDs are task-scoped. Questions represent scope gaps, material ambiguity, user decisions,
or bounded root-cause investigations. Multiple questions may remain open, and completion is blocked
until all are closed.

Each bounded investigation addresses one recorded question. Its answer distinguishes verified
evidence from hypotheses and includes the supporting repository and ledger evidence.

A non-convergence question seeks the root cause and a convergent correction rather than another
isolated symptom fix. Repository evidence can resolve factual questions; a choice that depends on
product intent or acceptable tradeoffs requires user judgment.
