#!/usr/bin/env bash

# Test whether we're in a git repo
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}

# Test whether git repo is clean
is_clean_repo() {
    $(git diff-index --no-ext-diff --quiet HEAD --)
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
    if [ $(type -P $1) ]; then
          return 0
    fi
    return 1
}