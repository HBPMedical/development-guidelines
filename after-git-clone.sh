#!/bin/sh
git submodule update --init

git fetch sp8 gh-pages
[ -d development-guidelines.pages ] || (
  git worktree add ../development-guidelines.pages sp8/gh-pages
  cd ../development-guidelines.pages && git checkout gh-pages
)
