# Harness agent adapters

Files below this directory adapt canonical Devflow roles to a concrete agent harness.

Keep protocol behavior out of these adapters. Each adapter should contain only harness-specific
metadata such as the concrete agent name, model/reasoning profile, sandbox settings, and a one-line
instruction to load the `devflow` skill and follow its role file.

Use a profile suffix in the concrete agent name only when a role has multiple model profiles.
Roles with one profile keep the unsuffixed role name.

Canonical role behavior lives in `skills/devflow/roles/`; shared protocol knowledge lives in
`skills/devflow/references/`.
