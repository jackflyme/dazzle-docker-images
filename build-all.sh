#!/bin/bash
set -euo pipefail

source setup-repo.sh
# First, build chunks without hashes
dazzle build $REPO -v --chunked-without-hash
# Second, build again, but with hashes
dazzle build $REPO -v
# Third, create combinations of chunks
dazzle combine $REPO --all -v
