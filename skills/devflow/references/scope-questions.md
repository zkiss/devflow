# Scope and questions

## Define the outcome and its increments

The `deliverable` task preserves the user's complete requested outcome, acceptance expectations,
constraints, and supplied context. It governs the whole ledger.

Each work task is self-contained and describes one coherent increment toward that outcome. Include
the relevant Deliverable context, objective, acceptance scenarios, boundaries, dependencies, and
material constraints. Specify implementation only when the request or established architecture
requires it. Make dependency-safe execution order visible in task IDs and summaries.

Create the smallest set of tasks that remains coherent and orderable. Add a task whenever required
work is discovered outside every existing task. Do not silently absorb unrelated work or rewrite
completed scope.

## Resolve questions explicitly

Use task-scoped question IDs for material ambiguity, user decisions, and bounded root-cause
investigations. Multiple questions may remain open, and completion is blocked until all are closed.

Investigate one recorded question at a time. Start from that question, inspect only relevant
repository and ledger context, distinguish evidence from hypothesis, and record the answer and
supporting evidence through `ratchet answer`.

When a loop flip-flops, ask for the root cause and a convergent correction rather than another
isolated symptom fix. Ask the user when the choice depends on product intent or acceptable
tradeoffs that repository evidence cannot resolve.
