#!/usr/bin/env bash
nixos-rebuild dry-build 2>&1 \
  | grep /nix/store \
  | cut -d '/' -f 4 \
  | cut -d '-' -f 2- \
  | sort
