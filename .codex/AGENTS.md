# Working preferences

## Scope and progress

- Carry authorized work through implementation and verification without
  repeatedly asking permission for reversible changes.
- Keep work focused on the requested goal. Respect read-only investigations:
  report findings in the conversation, and don't comment on issues or PRs
  unless asked.
- Report concrete findings and remaining work during longer tasks.
- Prefer the `gh` CLI for GitHub operations when available, and keep its
  output concise. Codex displays GitHub MCP calls with verbose arguments
  and uninformative "Action completed" messages; using `gh` avoids that
  display noise. Fall back to MCP when `gh` cannot perform the operation.

## Commits and pull requests

- Keep commits small and conceptually distinct. Separate independent fixes,
  refactors, formatting, and policy changes so each can be reviewed in isolation.
  Unrelated fixes found along the way belong in a separate PR.
- Rebase onto the latest default branch before opening a PR. Fold follow-up
  changes into the relevant commit rather than adding fixup commits. Keep PR
  descriptions aligned with commit messages and both in sync with the final diff.
- Use concise commit subjects and wrap commit bodies at 72 columns.
- Keep commit messages and PR descriptions standalone and timeless. Focus on
  what changed and the resulting behavior. Omit session chronology and
  incidental work. Omit routine test descriptions and validation results from
  commit messages and PR descriptions.

## Implementation

- Prefer simple, established tools and libraries over hand-rolled logic, and
  avoid unnecessary dependencies. Avoid speculative features, configuration
  options, and abstractions without a concrete benefit.
- Prefer Python or another language with static analysis for maintained
  scripts. Keep shell to short command sequences.
- Use consistent linting, formatting, and type checking. Avoid conflicting tools.
- Preserve existing formatting outside the requested changes.
- Script recurring work so results are reproducible. Keep scripts and their
  dependencies organized in clearly named directories.
- Obtain concrete bug reproductions and verify intended behavior. A crash fix
  should preserve correct output. Exercise malformed inputs in robustness work.
- Check claims against primary sources (code, history, upstream issues) rather
  than assuming. Confirm that a fix has an effect.
- After fixing a bug, consider whether a lint, type, or test would catch that
  class of bug.
- Tests should cover the project's own logic. Avoid tests that only exercise
  library behaviour or duplicate existing coverage.
- Review changes against the goals and design principles in the README.

## Writing and design

- Use concise, factual prose. Avoid marketing slogans, redundant labels, and
  descriptions of unrequested work.
- Keep READMEs focused on usage and design principles.
- Documentation should point to checks and scripts rather than restating the
  rules they enforce, since restated rules go stale.
- Preserve existing wording and visual character during design polish.
- Favor readable typography, consistent spacing and content widths, accessible
  contrast, and clear links. Avoid unnecessary decoration and redundant UI.
- Check mobile layouts and representative pages. Preserve working interactions
  during visual changes, and verify preview URLs before sharing them.
