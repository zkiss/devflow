# Devflow agent definitions

Devflow is a portable, multi-agent coding loop backed by `ratchet`.

This README is a non-normative overview. The complete protocol lives in the role definitions and
shared skill references listed below. Harness-specific agent files are shallow adapters that select
models and point at those canonical roles. The [documentation ownership rules](AGENTS.md) define
that split. When this overview differs from a protocol source, the protocol source governs.

Devflow drives a user-requested branch goal that should be accepted and shipped as one unit, such
as a pull request or Jira ticket. The ledger preserves its history across agent restarts and
follow-up requests.

The runner records the requested outcome. The planner makes it actionable and breaks it into work
tasks when useful. The runner drives tasks through implementation, verification, review, and
correction until both assurance results pass. Final assurance covers the combined outcome.

The role family consists of:

- devflow-runner — user-facing controller;
- devflow-planner — task decomposition and specification;
- devflow-worker — implementation and correction;
- devflow-verifier — deterministic project checks;
- devflow-reviewer — semantic engineering review; and
- devflow-analyst — bounded investigation and root-cause analysis.

Worker and reviewer have balanced and deep concrete agent variants because the runner selects their
model profile from task scope. Roles with one model profile keep their unsuffixed agent name.

Every concrete agent loads the `devflow` skill and follows its canonical role definition. The role
then loads only the shared references it names. Specialists use the ledger and repository sources
for their work, record substantive results through `ratchet`, and return only a terse outcome.
The runner uses task status and entry summaries to choose the next action without loading
implementation context.

After holistic assurance passes, the runner reports the result and material caveats, decisions,
or difficulties to the user. The ledger remains available so the work can be resumed or handed off
without conversational context.

## Protocol sources

- [Runner](skills/devflow/roles/runner.md)
- [Planner](skills/devflow/roles/planner.md)
- [Worker](skills/devflow/roles/worker.md)
- [Verifier](skills/devflow/roles/verifier.md)
- [Reviewer](skills/devflow/roles/reviewer.md)
- [Analyst](skills/devflow/roles/analyst.md)
- [Shared-topic index](skills/devflow/SKILL.md)
- [Codex adapters](agents/codex/)
- [OpenCode adapters](agents/opencode/)
- [Pi-subagents adapters](agents/pi-subagents/)
