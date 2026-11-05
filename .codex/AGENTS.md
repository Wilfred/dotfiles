# Working preferences

## Scope and progress

- Carry authorized work through implementation and verification without
  repeatedly asking permission for reversible changes.
- Keep work focused on the requested goal. Respect read-only investigations.
- Report concrete findings and remaining work during longer tasks.

## Commits and pull requests

- Keep commits small and conceptually distinct. Separate independent fixes,
  refactors, formatting, and policy changes so each can be reviewed in isolation.
- Use concise commit subjects and wrap commit bodies at 72 columns.
- Focus commit and PR descriptions on what changed, the resulting behavior,
  and relevant validation. Omit session chronology and incidental work.
- Follow through on requested pushes and merges by checking CI. Report local
  verification, CI results, and deployment status accurately and separately.

## Implementation

- Prefer simple, established tools and minimal dependencies. Avoid speculative
  features, configuration options, and abstractions without a concrete benefit.
- Prefer Python or another language with static analysis for maintained
  scripts. Keep shell to short command sequences.
- Use consistent linting, formatting, and type checking. Avoid conflicting tools.
- Script recurring work so results are reproducible. Keep scripts and their
  dependencies organized in clearly named directories.
- Obtain concrete bug reproductions and verify intended behavior. A crash fix
  should preserve correct output. Exercise malformed inputs in robustness work.

## Writing and design

- Use concise, factual prose. Avoid marketing slogans, redundant labels, and
  descriptions of unrequested work.
- Keep READMEs focused on usage and design principles.
- Preserve existing wording and visual character during design polish.
- Favor readable typography, consistent spacing and content widths, accessible
  contrast, and clear links. Avoid unnecessary decoration and redundant UI.
- Check mobile layouts and representative pages. Preserve working interactions
  during visual changes, and verify preview URLs before sharing them.
