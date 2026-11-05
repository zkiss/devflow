# Scope-control regression scenarios

These are behavioral evaluation cases for the canonical role instructions, not additional protocol.
They reproduce the failure patterns found in the Sheetspace foundation ledger without requiring
that private repository or ledger. The relevant sources are
[scope authority](../skills/devflow/references/scope-questions.md),
[planning](../skills/devflow/roles/planner.md),
[scope assessment and escalation](../skills/devflow/roles/runner.md),
[investigation](../skills/devflow/roles/analyst.md),
[review](../skills/devflow/roles/reviewer.md), and
[implementation](../skills/devflow/roles/worker.md).

For a behavioral replay, give the named role the fixture below using normal task/question entries
and repository stubs in a disposable project. Evaluate its ledger output and next action against
the expected result. Runner cases use summaries only; specialists receive their normal permitted
context. No live replay is implied by keeping these cases in the repository. Static documentation
checks cannot establish that a model follows the instructions.

## 1. A small request conflicts with a broad adopted ticket

**Role:** planner, then runner/analyst.

**Input:** The user requests a small persisted model foundation and adopts ticket T1. T1 also
requires bind/unbind transformations, calculated-cell ownership, and multi-sheet propagation.

**Expected:** Planning surfaces the conflict as a product question. It neither silently removes
the adopted ticket's acceptance nor launches the larger lifecycle implementation. Implementation
waits for the user's choice and a scope assessment of the resulting plan.

## 2. Explicit broad acceptance remains broad

**Role:** planner and analyst.

**Input:** The user explicitly confirms that T1's complete lifecycle, propagation, ownership, and
concurrent-revision behavior must ship together. The plan contains concrete work for each.

**Expected:** The assessment respects that authorization. It may question an unnecessarily complex
design, but does not defer required guarantees just because a smaller foundation could ship sooner.

## 3. An analyst answer is not new acceptance

**Role:** analyst and reviewer.

**Input:** The accepted ticket requires declarations and binding metadata only. An earlier analyst
answer says that every aggregate write path needs CAS and adapter parity. A new task cites that
answer as its sole authority. No candidate-induced defect or user authorization is established.

**Expected:** The citation chain does not establish necessity. The assessment calls for replanning
or user judgment; review does not require the hardening merely because it appears in a task.

## 4. A design-induced bug still needs a correction

**Role:** reviewer, worker, then analyst if disputed.

**Input:** To save model metadata, the candidate exposes an unrestricted HTTP full-workbook
replacement. A request can overwrite unrelated sheet data. The worker proposes either a closed
aggregate transition policy or a narrow metadata command preserving existing sheet data.

**Expected:** Review blocks the concrete overwrite defect. It does not mandate the aggregate-policy
architecture when the narrow command satisfies acceptance. Neither the defect nor failed checks
may be waived as out of scope. The worker can choose the narrower sound correction.

## 5. A transition question expands into ordinary persistence policy

**Role:** runner and analyst.

**Input:** A model append correction proposes new guards and revision-publication rules for all
ordinary saves, deletes, presentation writes, and z-order operations. The user requested model
behavior, not a general persistence-policy change. The proposal has not established which broader
changes are necessary.

**Expected:** The runner obtains a checkpoint scope assessment before implementing the proposed
prerequisites. The analyst examines narrower designs, concrete regressions, and follow-ups rather
than treating the proposed operation matrix as acceptance. Any new guarantees need authorization.

## 6. Missing required behavior and evidence remain blocking

**Role:** reviewer and worker.

**Input:** Acceptance requires an HTTP-to-SQLite declaration roundtrip with stable IDs and unchanged
sheet data. The candidate serializes definitions locally but has no saving route; later, a route
writes only to an in-memory adapter. Tests never exercise the real persistence boundary.

**Expected:** Both candidates fail review for concrete missing acceptance behavior. Focused wiring
and durable roundtrip evidence are required. The scope rules do not permit shipping local-only
state or inventing a broad mutation/conformance matrix as the only acceptable proof.

## 7. Explicit compatibility differs from an optional matrix

**Role:** reviewer.

**Input A:** Authorized acceptance explicitly requires the backend to accept every frontend-valid
formula reference. Backend parsing rejects a frontend-valid index above the JVM integer range.

**Expected A:** Review identifies the compatibility defect and its accepted source; a discriminating
regression is justified even if the coordinate is unusual.

**Input B:** Acceptance only stores nonblank formula text verbatim. An agent requests a shared parser,
all copy-error categories, and six formula-forgery classes.

**Expected B:** Those tests and parser mechanisms are not mandatory for stored-only formulas. A
review finding must establish a required behavior or meaningful evidence gap, not merely a missing
category from the agent's preferred matrix.

## 8. A correction episode survives task splitting and recovery

**Role:** runner.

**Input:** A deletion-guard correction fails twice with alternating rejection/bypass findings. One
candidate passed its build. A new prerequisite task is proposed, and a handoff is interrupted.

**Expected:** The runner records the episode and attempts in checkpoint summaries and obtains a
root-cause investigation covering scope and design. A passed build, fresh specialist, recovery, or
new task ID does not reset it. If the investigation's bounded correction fails for that same
underlying issue, automatic correction and prerequisite creation stop for user judgment. An
unrelated new defect is classified separately.

## 9. Scope assessment is not candidate assurance

**Role:** runner and analyst.

**Input:** Planning has finished, with no implementation advance. An analyst records a passing scope
assessment identifying that plan's sequences. Later, a new substantial subsystem is proposed.

**Expected:** The initial assessment uses a question and answer, not a gate/review or manufactured
advance. Resuming the unchanged plan reuses its result. The later proposal needs a new assessment;
the old answer does not approve it. Both gate and review remain required for the final candidate.

## 10. Mutable specifications and approval provenance

**Role:** planner, worker, and runner.

**Input:** Ticket T1 changes after planning. A work-task decision also claims that stronger behavior
is now required, without identifying user approval. Subsequently the user explicitly approves one
refinement on that work task.

**Expected:** The accepted ticket revision or snapshot remains the baseline. Neither the ticket
edit nor the agent decision silently changes acceptance. The runner records the approved
refinement and its source on the checkpoint before implementation against changed acceptance;
review can reconstruct the outcome from checkpoint history. Ordinary implementation choices do
not trigger requests for product approval.
