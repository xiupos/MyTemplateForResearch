# MyTemplateForResearch

## Requirements

- [Julia](https://julialang.org/downloads/)
- [Just](https://just.systems/man/en/installation.html)
- [VSCode](https://code.visualstudio.com/Download) (or your favorite editor)
- [Pandoc](https://pandoc.org/installing.html) (My defaults are available on [my dotfiles](https://github.com/xiupos/dotfiles/tree/main/private_dot_local/private_share/pandoc))
- [Pluto.jl](https://plutojl.org/#install) (Optional)

## Getting Started

```sh
# 1. Clone the template
git clone git@github.com:xiupos/MyTemplateForResearch.git YourProjectName
cd YourProjectName
rm -rf .git && git init .
# ... or use "Use this template" on GitHub

# 2. Initialize the project
just init

# 3. ... and start your research!
```

> [!WARNING]
> You should remove the "Getting Started" section from this README after initialization.

## Notebook

```sh
# Pluto.jl
cp -r tasks/00_pluto tasks/01_new_task
just pluto
# ... and open tasks/01_new_task/notebook.jl

# Jupyter
cp -r tasks/00_jupyter tasks/01_new_task
# ... and open tasks/01_new_task/notebook.ipynb with VSCode
```

## Test

```sh
just test
```

## PDF & TeX

```sh
# Configure `pandoc_flags` in ./justfile

# PDF
just pdf path/to/doc.md

# TeX
just tex path/to/doc.md
```
