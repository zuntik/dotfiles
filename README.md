# My dotfiles

Install [chezmoi](https://www.chezmoi.io).

Clone the repo with `chezmoi init <repo>`.

Run `chezmoi apply --dry-run --verbose` to make sure nothing will be lost before applying the files. `chezmoi diff` may also be useful.

Run `chezmoi merge <target file>` to solve conflitcs.

Then install the files with `chezmoi apply`.

