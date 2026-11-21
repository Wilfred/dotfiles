---
name: done
description: Finish a development session by consolidating useful lessons in shared memory and removing this session's merged worktrees and branches, when cleanup is requested.
---

Use the current session to identify the repository, worktrees, branches, and PRs
to finish. Invoking `$done` authorizes cleanup of this session's merged work;
it does not authorize merging PRs or cleaning unrelated work.

## Consolidate session lessons

- Locate or clone <https://github.com/Wilfred/shared_memory>, read its README,
  and follow `consolidate.md`. Review user corrections, preferences, and verified
  findings while the session's worktrees and evidence are still available.
- Record useful lessons directly in shared memory, with general preferences
  and project-specific knowledge in their appropriate places. Apply the repo's
  future-use criteria and size checks; skip updates when nothing useful is new.
- Follow the memory repo's sync workflow: pull regularly, commit useful changes,
  and push directly to `main` without routine confirmation. Keep these commits
  separate from project changes and preserve them outside cleanup candidates.
- Preserve unsynced work and report sync failures. Keep durable lessons in shared
  memory rather than redirecting them to AGENTS.md or harness-local memory.

## Clean up merged work

- Inspect Git status, worktrees, remotes, and the remote default branch. Fetch
  and prune remote-tracking references. Limit candidates to work attributable
  to this session unless the user explicitly requests broader cleanup.
- Verify merge status from the hosting service and compare branch tips with the
  merged PR's head. Squash and rebase merges may not satisfy Git ancestry checks.
  For work merged without a PR, verify ancestry against the fetched default
  branch. Preserve open or closed-but-unmerged PRs and branches with later work.
- Check candidate worktrees for tracked and untracked changes and local commits
  absent from the merged work. Preserve dirty worktrees, valuable ignored files,
  and work used by another active task. Report uncertain candidates as retained.
- Move command execution to a surviving checkout before removing the current
  worktree. Preserve the primary checkout. Prefer managed removal tools when
  available; otherwise use `git worktree remove`, without forcing removal.
- Delete the corresponding merged local branches after removing their worktrees.
  Prefer `git branch -d`; use `-D` only when a verified squash or rebase merge
  prevents it and the local tip exactly matches the merged PR head. Never delete
  the default branch or a branch still checked out in a surviving worktree.
- Delete corresponding remote feature branches only after verifying their current
  tips contain no work beyond the merged PR head. Use an expected-tip lease when
  deleting them to protect concurrent updates. An already deleted branch needs
  no action. Prune stale worktree metadata after checking remaining worktrees.
- If credentials or permissions prevent a step, complete independent cleanup
  and report the blocked action without repeatedly retrying.

Finish with what was removed, what was retained and why, the surviving checkout,
and any shared-memory updates or sync failures.
