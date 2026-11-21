---
name: pr
description: Implement a requested feature in a fresh worktree and branch, then verify, commit, push, and open a PR.
---

Use the feature description accompanying `$pr`, or the feature already requested in the conversation. If no feature is specified, ask for it. Invoking this skill requests the full workflow through PR creation; proceed without routine confirmation, while respecting execution permissions.

- Read applicable AGENTS.md instructions and the README. Inspect repository status, remotes, and worktrees. Preserve existing changes and determine the remote default branch.
- Fetch the latest default branch and create a fresh worktree from it. Prefer managed worktree tools when available, waiting for creation to complete before using the returned path; otherwise use git worktree. Create a unique, concise, descriptive branch following repository conventions. Perform feature edits and subsequent Git operations in that worktree, leaving the original checkout's branch and changes intact.
- Implement the requested feature with a focused diff and proportional coverage. Run the project's required checks and review the final diff. Resolve material ambiguity before implementing dependent work.
- Commit only intended changes in small, conceptually distinct commits. Follow repository commit conventions. Fetch and rebase onto the latest remote default branch before opening the PR, resolving conflicts and rerunning affected checks. Fold follow-up changes into the relevant commits.
- Push the feature branch and open a PR against the default branch using the available GitHub integration or gh. Follow repository instructions and any PR template for the title and description. Check for an existing PR before creating one when retrying. Leave the PR unmerged and the worktree available for follow-up work.

Finish with the PR link, worktree path, branch, a brief description of the result, and local verification.
