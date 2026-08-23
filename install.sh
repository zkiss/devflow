#!/usr/bin/env bash

set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
install_root=${DEVFLOW_INSTALL_ROOT:-${HOME:?HOME must be set}}
skill_install_dir="$install_root/.agents/skills"
agent_install_dir="$install_root/.codex/agents"

sources=("$repo_root/skills/devflow")
destinations=("$skill_install_dir/devflow")

for agent_source in "$repo_root"/agents/*.toml; do
    sources+=("$agent_source")
    destinations+=("$agent_install_dir/${agent_source##*/}")
done

for index in "${!sources[@]}"; do
    source_path=${sources[$index]}
    destination_path=${destinations[$index]}

    if [[ -L "$destination_path" ]]; then
        existing_target=$(readlink -- "$destination_path")
        if [[ "$existing_target" != "$source_path" ]]; then
            printf 'Refusing to replace %s -> %s\n' "$destination_path" "$existing_target" >&2
            exit 1
        fi
    elif [[ -e "$destination_path" ]]; then
        printf 'Refusing to replace existing path: %s\n' "$destination_path" >&2
        exit 1
    fi
done

mkdir -p -- "$skill_install_dir" "$agent_install_dir"

for index in "${!sources[@]}"; do
    source_path=${sources[$index]}
    destination_path=${destinations[$index]}

    if [[ -L "$destination_path" ]]; then
        printf 'Already linked: %s\n' "$destination_path"
    else
        ln -s -- "$source_path" "$destination_path"
        printf 'Linked %s -> %s\n' "$destination_path" "$source_path"
    fi
done
