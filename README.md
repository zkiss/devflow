# Devflow agent definitions

Devflow is a portable, multi-agent coding loop backed by `ratchet`.

This README is a non-normative overview. The complete protocol lives in the role definitions and
shared skill references listed below. The [documentation ownership rules](AGENTS.md) define that
split. When this overview differs from a protocol source, the protocol source governs.

One loop produces one **Deliverable**: a user-requested outcome that should be accepted and shipped
as one unit, such as a pull request or Jira ticket. The ledger preserves the loop's state across
agent restarts.

The runner records the Deliverable in a reserved `deliverable` task. The planner creates one or
more work tasks, each a coherent increment toward that outcome. The runner drives every work task
through implementation, verification, review, and correction until both assurance results pass.
After all work tasks are complete, it runs the same loop on `deliverable` as a holistic final pass.

The agent family consists of:

- devflow-runner — user-facing controller;
- devflow-planner — task decomposition and specification;
- devflow-worker — implementation and correction;
- devflow-verifier — deterministic project checks;
- devflow-reviewer — semantic engineering review; and
- devflow-analyst — bounded investigation and root-cause analysis.

Every agent loads the `devflow` skill, then only the references named by its own definition.
Specialists read their instructions and prior results from the ledger through `ratchet` and from
repository sources cited there, write substantive results back, and return only a terse outcome.
The runner uses task status and entry summaries to choose the next action without loading
implementation context.

After holistic assurance passes, the runner reports the result and material caveats, decisions,
or difficulties to the user. The ledger remains available so the work can be resumed or handed off
without conversational context.

## Protocol sources

- [Runner](agents/devflow-runner.toml)
- [Planner](agents/devflow-planner.toml)
- [Worker](agents/devflow-worker.toml)
- [Verifier](agents/devflow-verifier.toml)
- [Reviewer](agents/devflow-reviewer.toml)
- [Analyst](agents/devflow-analyst.toml)
- [Shared-topic index](skills/devflow/SKILL.md)
