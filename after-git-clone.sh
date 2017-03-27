#!/bin/sh
git submodule update --init

git remote show | grep sp8 > /dev/null || (git remote add sp8 git@github.com:HBPMedical/development-guidelines.git && git pull sp8 master) || true

git fetch sp8 gh-pages
[ -d development-guidelines.pages ] || (
  git worktree add ../development-guidelines.pages sp8/gh-pages
  cd ../development-guidelines.pages && git checkout gh-pages
)
