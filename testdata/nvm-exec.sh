#!/usr/bin/env bash

DIR="$(command cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

unset NVM_CD_FLAGS

# shellcheck disable=SC1090,SC1091
\. "$DIR/nvm.sh" --no-use

if [ -n "$NODE_VERSION" ]; then
  nvm use "$NODE_VERSION" > /dev/null || exit 127
elif ! nvm use >/dev/null 2>&1; then
  echo "No NODE_VERSION provided; no .nvmrc file found" >&2
  exit 127
fi

exec "$@"