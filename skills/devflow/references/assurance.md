# Assurance

A gate and a review are independent checks of the same latest candidate commit. Both must pass
after its latest advance.

## Gate

A gate supplies deterministic evidence. Run the authoritative applicable build, tests, lint,
typecheck, formatting, spec validation, generated-file checks, or equivalents. A `deliverable` gate
runs the full authoritative suite; a work-task gate runs every check applicable to that increment.

PASS means all required checks succeeded. FAIL means any required check failed, could not run
reliably, or returned an invalid result. Never weaken or skip a required check. Record commands and
concise diagnostics in the gate entry's details.

## Review

A review supplies independent semantic engineering judgment. Assess the task's scope and
acceptance scenarios, correctness, missing behavior, architecture consistency, complexity,
maintainability, error handling, tests, compatibility, migrations, security, concurrency,
documentation, and unrelated changes as applicable.

For `deliverable`, review the combined change holistically against the full user outcome rather
than rechecking tasks in isolation. Passing tests do not replace this judgment. Do not fail for an
optional enhancement outside the Deliverable. Record actionable failure findings, impacts, and
locations in the review entry's details.

## Correction loop

After either failure, the next implementation pass reads the failed entry, fixes the recorded
issues, commits, and advances the task. That advance makes both prior assurance results stale, so
verification and review must run again. Repeated or alternating failures require root-cause
intervention before another blind correction cycle.
