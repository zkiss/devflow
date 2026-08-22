# Using `ratchet`

Use only the `ratchet` CLI to read and write the ledger.

## Discover the installed interface

Use `ratchet --help` whenever the available operations are unknown or may have changed. Before
using an unfamiliar operation, run `ratchet <command> --help`. The installed help is authoritative
for command names, arguments, options, limits, and validation rules.

## Use one working directory

`ratchet` reads and writes `.ratchet` in its process working directory. Always run it from the
project root. Running it elsewhere may access different state.

## Read selectively

Begin with current status and prefer summaries. Inspect a task's log only to locate entries needed
for the current action, and read details only from those entries. Do not preload unrelated task
histories.

## Write durable handoffs

Every substantive step must produce the corresponding ledger entry through `ratchet` before work
is handed off. Summaries are concise and decision-oriented. They surface any material caveat,
consequential decision, difficult resolution, or blocker that can affect the next action or final
report.

Put specifications, evidence, reasoning, diagnostics, scenarios, locations, and actionable
feedback in entry details so work can continue from the ledger alone. Respect the current size and
format limits reported by the CLI.

Persist consequential decisions that change or sharpen a task's expected outcome. Keep work
context in the ledger rather than repeating it in handoff prompts.
