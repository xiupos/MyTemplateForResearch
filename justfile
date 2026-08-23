pandoc_flags := "-d article-ja"

julia:
  julia --project

pluto:
  julia -e 'import Pluto; Pluto.run(auto_reload_from_file = true)'

test:
  julia --project -e 'using Pkg; Pkg.test()'

pdf markdown_path:
  #!/usr/bin/env bash
  cd $(dirname {{markdown_path}})
  pandoc {{pandoc_flags}} $(basename {{markdown_path}}) \
    -o $(basename {{markdown_path}} .md).pdf

tex markdown_path:
  #!/usr/bin/env bash
  cd $(dirname {{markdown_path}})
  pandoc {{pandoc_flags}} $(basename {{markdown_path}}) \
    -o $(basename {{markdown_path}} .md).tex

init:
  #!/usr/bin/env bash
  NEW_NAME=$(basename "$PWD")

  # Are you sure?
  read -p "Are you sure you want to rename the package to '$NEW_NAME'? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
  fi

  # Rename the package
  find . -type f -not -path '*/.git/*' -exec sed -i "s/MyTemplateForResearch/${NEW_NAME}/g" {} +
  find . -depth -not -path '*/.git*' -name "*MyTemplateForResearch*" | while read -r f; do
    mv "$f" "$(dirname "$f")/$(basename "$f" | sed "s/MyTemplateForResearch/${NEW_NAME}/g")"
  done

  # Generate a new UUID
  sed -i "s/^uuid = .*/uuid = \"$(julia -e 'using UUIDs; print(uuid4())')\"/" Project.toml

  # Initialize package environment
  rm Manifest*.toml
  julia --project=. -e 'using Pkg; Pkg.instantiate()'

  # Initialize a new git repository
  rm -rf .git && git init .
