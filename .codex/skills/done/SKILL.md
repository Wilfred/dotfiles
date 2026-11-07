---
name: done
description: Finish a development session by removing merged worktrees and branches and reviewing session lessons for repository and dotfiles AGENTS.md updates, when the user requests cleanup.
---

Use the current session to identify the repository, worktrees, branches, and PRs
to finish. Invoking `$done` authorizes cleanup of this session's merged work;
it does not authorize merging PRs or cleaning unrelated work.

## Review session lessons

- Read the repository's applicable AGENTS.md files and the working preferences
  in dotfiles (normally `~/dotfiles/.codex/AGENTS.md`). Review user corrections,
  preferences, and verified findings from this session before removing worktrees.
- Consider repository-specific instructions for project facts and conventions,
  and dotfiles instructions for preferences that apply across projects.
- Suggest only reusable, evidence-backed guidance that is missing or contradicts
  existing instructions. Prefer revising an existing rule over adding a duplicate.
  Keep guidance standalone and timeless; omit session chronology, finding IDs,
  temporary environment problems, and one-off choices presented as general rules.
- Report concrete proposed wording and its destination, or say no updates are
  needed. Edit AGENTS.md only if the user has requested or already authorized
  those updates. Keep authorized policy changes separate from feature commits,
  and preserve them outside any worktree scheduled for removal.

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
and any proposed or applied AGENTS.md updates.
