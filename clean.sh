#!/bin/bash

# Clean script for Epiphany game

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Cleaning build artifacts..."

# Remove build directory
if [ -d "${PROJECT_ROOT}/build" ]; then
    echo "  Removing build directory..."
    rm -rf "${PROJECT_ROOT}/build"
fi

# Remove autotools artifacts from source tree
echo "  Cleaning source tree..."
cd "${PROJECT_ROOT}"

# Remove generated Makefiles from source
find . -name "Makefile" -not -path "./build/*" -not -name "Makefile.am" -not -name "Makefile.in" -not -name "Makefile.win" -delete 2>/dev/null || true

# Remove autotools cache and temporary files
rm -f config.log config.status stamp-h1 config.h 2>/dev/null || true
rm -rf autom4te.cache 2>/dev/null || true

# Remove .deps directories
find . -type d -name ".deps" -not -path "./build/*" -exec rm -rf {} + 2>/dev/null || true

# Remove object files that might be in source
find ./src -name "*.o" -delete 2>/dev/null || true

# Remove compiled binaries from source
rm -f src/epiphany src/epiphany-game 2>/dev/null || true

echo "Clean complete!"
echo ""
echo "To build, run: ./build.sh"
