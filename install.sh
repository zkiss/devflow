#!/usr/bin/env bash

set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
install_root=${DEVFLOW_INSTALL_ROOT:-${HOME:?HOME must be set}}
skill_install_dir="$install_root/.agents/skills"

skill_source="$repo_root/skills/devflow"
skill_destination="$skill_install_dir/devflow"

usage() {
    printf 'Usage: %s <harness>\n' "${0##*/}" >&2
}

list_harnesses() {
    for candidate in "$repo_root"/agents/*/install.sh; do
        [[ -f "$candidate" ]] || continue
        harness_dir=$(dirname -- "$candidate")
        printf '%s\n' "${harness_dir##*/}"
    done
}

if [[ $# -ne 1 ]]; then
    usage
    printf 'Available harnesses:\n' >&2
    list_harnesses >&2
    exit 1
fi

harness=$1
harness_install="$repo_root/agents/$harness/install.sh"

if [[ ! -f "$harness_install" ]]; then
    printf 'Unknown harness: %s\n' "$harness" >&2
    printf 'Available harnesses:\n' >&2
    list_harnesses >&2
    exit 1
fi

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

mkdir -p -- "$skill_install_dir"

if [[ -L "$skill_destination" ]]; then
    printf 'Already linked: %s\n' "$skill_destination"
else
    ln -s -- "$skill_source" "$skill_destination"
    printf 'Linked %s -> %s\n' "$skill_destination" "$skill_source"
fi

export DEVFLOW_INSTALL_ROOT="$install_root"
bash -- "$harness_install"
