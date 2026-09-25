#!/usr/bin/env bash

set -euo pipefail

harness_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(CDPATH= cd -- "$harness_root/../.." && pwd -P)
install_root=${DEVFLOW_INSTALL_ROOT:-${HOME:?HOME must be set}}
agent_install_dir="$install_root/.config/opencode/agents"

agent_sources=()
agent_destinations=()

for agent_source in "$harness_root"/*.md; do
    agent_sources+=("$agent_source")
    agent_destinations+=("$agent_install_dir/${agent_source##*/}")
done

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

mkdir -p -- "$agent_install_dir"

for index in "${!agent_sources[@]}"; do
    source_path=${agent_sources[$index]}
    destination_path=${agent_destinations[$index]}

    if [[ -L "$destination_path" ]]; then
        rm -- "$destination_path"
    fi
    cp -- "$source_path" "$destination_path"
    printf 'Copied %s -> %s\n' "$source_path" "$destination_path"
done
