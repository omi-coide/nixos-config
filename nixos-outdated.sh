#!/usr/bin/env bash
nixos-rebuild dry-build 2>&1 \
  | grep /nix/store
