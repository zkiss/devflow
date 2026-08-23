# Assurance

A gate and a review are independent checks of the same candidate commit. A candidate requires both
checks to pass.

## Gate

A gate supplies deterministic evidence from the authoritative build, tests, lint, typecheck,
formatting, spec validation, generated-file checks, and equivalents applicable to the candidate. A
`deliverable` gate covers the full authoritative suite; a work-task gate covers every check
applicable to that increment.

PASS means all required checks succeeded. FAIL means any required check failed, could not run
reliably, returned an invalid result, or was weakened or omitted. Gate details identify the
commands and concise diagnostics that support the result.

## Review

A review supplies independent semantic engineering judgment. Its applicable dimensions include
the task's scope and acceptance scenarios, correctness, missing behavior, architecture
consistency, complexity, maintainability, error handling, tests, compatibility, migrations,
security, concurrency, documentation, and unrelated changes.

A `deliverable` review covers the combined change holistically against the full user outcome rather
than rechecking tasks in isolation. Passing deterministic checks does not replace this judgment,
and an optional enhancement outside the Deliverable is not a failure. Review failure details
identify each actionable finding, its impact, and its location.

## Correction loop

After either failure, a corrected candidate is a new committed advance that addresses the recorded
issues and requires both checks again. Repeated or alternating failures are non-convergence and
require a root-cause resolution before another correction cycle.
