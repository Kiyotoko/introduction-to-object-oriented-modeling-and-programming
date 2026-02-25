# Contributing

Thank you for your interest in contributing to the script.
This guide provides all the information you need to get started.

## Open an Issue

You can open an issue on GitHub [here](https://github.com/tau-lang/tau/issues/new/choose).

Providing clear and detailed information helps us reproduce issues quickly and understand your requests more effectively.

## Open a Pull Request

> [!tip]
> If you use Nix, you can get Typstyle by running
> ```sh
> nix-shell -p typstyle
> ```

To contribute code, please follow these steps:

1. Fork the repository on GitHub.
2. Clone your fork locally.
3. Make your changes.
4. Format your code by running
  ```sh
  typstyle -i ./**/*.typ
  ```
5. Commit your changes and open a pull request. In the pull request:
  - Use the pull request template.
  - Describe the changes you made.
  - Reference any related issues.
  - Complete the checklist.

## Commit Conventions


We use the [conventional commits](https://www.conventionalcommits.org/) conventions. Please write your commit messages **in English only**! Your commit messages should follow this structure:

- feat(scope): add your cool new feature
- fix: fix a bug
- docs: add or improve documentation
- style: reformat code (no logic changes)

Write commit messages in the imperative mood (e.g., “add feature”, not “added feature”).

## Compiling the PDF

You can compile all PDF's for all languages by running the following command from the root:

```sh
typst compile --root . ./**/main.typ
```
