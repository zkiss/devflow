# Git and stamped evidence

- Keep the worktree clean before every `ratchet` write.
- Commit implementation changes before `ratchet advance` records HEAD as the task's latest
  candidate.
- Ledger sequence numbers establish the order of advances across all tasks.
- A work task's fixed diff base is the SHA on the latest `advance` event whose sequence precedes
  that task's first `advance`. If no earlier `advance` exists, use the task creation SHA.
- The `deliverable` diff base is its creation SHA.
- The latest `advance` SHA for the reviewed task is the diff head.
- Every later `advance` for the same task requires a newer descendant commit.
- Every ledger entry written through `ratchet` captures the current Git SHA.
- `gate` and `review` results apply only to the exact candidate commit they stamp.
- A later `advance` makes both earlier assurance results for that task stale.
- Verify and review the task's complete recorded increment, not merely the most recent correction
  commit.
