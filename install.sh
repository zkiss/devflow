#!/usr/bin/env bash

set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
install_root=${DEVFLOW_INSTALL_ROOT:-${HOME:?HOME must be set}}
skill_install_dir="$install_root/.agents/skills"
agent_install_dir="$install_root/.codex/agents"

skill_source="$repo_root/skills/devflow"
skill_destination="$skill_install_dir/devflow"
agent_sources=()
agent_destinations=()

for agent_source in "$repo_root"/agents/*.toml; do
    agent_sources+=("$agent_source")
    agent_destinations+=("$agent_install_dir/${agent_source##*/}")
done

if [[ -L "$skill_destination" ]]; then
    existing_target=$(readlink -- "$skill_destination")
    if [[ "$existing_target" != "$skill_source" ]]; then
        printf 'Refusing to replace %s -> %s\n' "$skill_destination" "$existing_target" >&2
        exit 1
    fi
elif [[ -e "$skill_destination" ]]; then
    printf 'Refusing to replace existing path: %s\n' "$skill_destination" >&2
    exit 1
fi

for index in "${!agent_sources[@]}"; do
    source_path=${agent_sources[$index]}
    destination_path=${agent_destinations[$index]}

    if [[ -L "$destination_path" ]]; then
        existing_target=$(readlink -- "$destination_path")
        if [[ "$existing_target" != "$source_path" ]]; then
            printf 'Refusing to replace %s -> %s\n' "$destination_path" "$existing_target" >&2
            exit 1
        fi
    elif [[ -e "$destination_path" && ! -f "$destination_path" ]]; then
        printf 'Refusing to replace existing path: %s\n' "$destination_path" >&2
        exit 1
    fi
done

mkdir -p -- "$skill_install_dir" "$agent_install_dir"

if [[ -L "$skill_destination" ]]; then
    printf 'Already linked: %s\n' "$skill_destination"
else
    ln -s -- "$skill_source" "$skill_destination"
    printf 'Linked %s -> %s\n' "$skill_destination" "$skill_source"
fi

for index in "${!agent_sources[@]}"; do
    source_path=${agent_sources[$index]}
    destination_path=${agent_destinations[$index]}

    if [[ -L "$destination_path" ]]; then
        rm -- "$destination_path"
    fi
    cp -- "$source_path" "$destination_path"
    printf 'Copied %s -> %s\n' "$source_path" "$destination_path"
done
