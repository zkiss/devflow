# Git and stamped evidence

- Commit implementation changes before `ratchet advance` records HEAD as the task's latest
  candidate.
- When a task is already complete at HEAD and needs no implementation commit, use
  `ratchet advance --no-commit` to record that existing commit as its candidate.
- Ledger sequence numbers establish the order of advances across all tasks.
- A work task's fixed diff base is the SHA on the latest `advance` event whose sequence precedes
  that task's first `advance`. If no earlier `advance` exists, use the task creation SHA.
- If other tasks advance while a task is suspended, its later fixed-base diff includes those
  intervening commits.
- The `deliverable` diff base is its creation SHA.
- The latest `advance` SHA for the reviewed task is the diff head.
- An `advance` normally requires a newer descendant commit; `--no-commit` permits the current HEAD
  only when no implementation commit is needed.
- Every ledger entry written through `ratchet` captures the current Git SHA.
- `gate` and `review` results apply only to the exact candidate commit they stamp.
- A later `advance` makes both earlier assurance results for that task stale.
- Verify and review the task's complete recorded increment, not merely the most recent correction
  commit.
