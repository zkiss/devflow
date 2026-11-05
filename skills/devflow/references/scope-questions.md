# Scope and questions

## Outcome and increments

`deliverable-1` preserves the user's initial branch goal, acceptance expectations, constraints,
and supplied context. Each later checkpoint records the requested adjustment and its predecessor.
The expected outcome at a checkpoint is cumulative: the initial goal and authorized refinements
through that checkpoint. Earlier requirements remain applicable unless an authorized later entry
explicitly supersedes them.

## Requirement authority

The user's request, specifications the user adopts for this delivery, and applicable repository
rules establish acceptance. A broader roadmap is context, not authorization to deliver every
related capability. An adopted specification may itself be broad; a material conflict with the
requested delivery boundary remains a product question, not permission to silently narrow it.

Each requirement has a traceable source. An external ticket or other mutable source needs its
accepted revision or a concise acceptance snapshot in the ledger. Repository specifications use
their tracked path and accepted Git revision. Later edits do not silently change acceptance.

Derived work is necessary when concrete evidence shows that the authorized outcome cannot work
correctly without it, including defects or regressions introduced by the candidate. Its rationale
connects that evidence to the source requirement, rather than ending at another agent's assertion.
An implementation choice is one means of satisfying a requirement, not a new product requirement.
Problems caused by that choice can justify replacing or simplifying it instead of extending it.

Decisions, analyst answers, and review findings preserve evidence and choices; recording them does
not authorize new behavior, broader guarantees, or optional assurance as acceptance. Such changes
require user authorization. Routine implementation choices and necessary correctness work within
the authorized outcome do not require separate approval.

## Scope ownership

Checkpoint entries own branch-level requirements: acceptance criteria, constraints, and expected
user-visible behavior. Work-task entries own increment specifications and local implementation
decisions. Authorized changes to the branch outcome are recorded on the active checkpoint before
implementation against the changed acceptance. Unapproved changes remain proposals. Checkpoint
history is sufficient to reconstruct the cumulative expected outcome without reading work-task
histories.

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

A **scope gap** exists when necessary work within the authorized outcome but outside the current
task blocks it. A proposed expansion is an authorization question, not an established scope gap.
Resolving a gap determines whether the work belongs to another open task or requires a new task.
The gap is represented by a blocking question on the current task. Its summary identifies the need
for decomposition, and its details record the evidence, impact, and recommended next step. The answer
summary identifies the prerequisite task IDs, their dependency order, and when the blocked task can
resume.

## Questions

Question IDs are task-scoped. Questions represent scope gaps, material ambiguity, user decisions,
or bounded root-cause investigations. Multiple questions may remain open, and completion is blocked
until all are closed.

Each bounded investigation addresses one recorded question. Its answer distinguishes verified
evidence from hypotheses and includes the supporting repository and ledger evidence.

A scope assessment compares the proposed plan or correction with requirement authority and the
delivery boundary. It is planning evidence, not a candidate gate or review, and does not replace
final assurance.

A non-convergence question seeks the root cause and a convergent correction rather than another
isolated symptom fix. Repository evidence can resolve factual questions; a choice that depends on
product intent or acceptable tradeoffs requires user judgment.
