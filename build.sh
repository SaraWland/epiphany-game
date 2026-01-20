#!/bin/bash

# Build script for Epiphany game using out-of-source build

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${PROJECT_ROOT}/build"

echo -e "${BLUE}=== Epiphany Game Build Script ===${NC}"

# Parse arguments
DEBUG_MODE=""
CLEAN=""
CONFIGURE_ONLY=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --debug)
            DEBUG_MODE="--enable-debug"
            shift
            ;;
        --clean)
            CLEAN="1"
            shift
            ;;
        --configure-only)
            CONFIGURE_ONLY="1"
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --debug           Build in debug mode"
            echo "  --clean           Clean build directory before building"
            echo "  --configure-only  Only run configure, don't build"
            echo "  --help, -h        Show this help message"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

# Clean if requested
if [ -n "$CLEAN" ]; then
    echo -e "${BLUE}Cleaning build directory...${NC}"
    rm -rf "$BUILD_DIR"
fi

# Create build directory
mkdir -p "$BUILD_DIR"

# Change to build directory
cd "$BUILD_DIR"

# Configure if needed
if [ ! -f "Makefile" ]; then
    echo -e "${BLUE}Configuring project...${NC}"
    "${PROJECT_ROOT}/configure" $DEBUG_MODE
else
    echo -e "${GREEN}Build already configured. Use --clean to reconfigure.${NC}"
fi

# Build unless configure-only
if [ -z "$CONFIGURE_ONLY" ]; then
    echo -e "${BLUE}Building project...${NC}"
    make -j$(nproc)
    
    echo ""
    echo -e "${GREEN}=== Build complete! ===${NC}"
    echo -e "Binary location: ${GREEN}${BUILD_DIR}/epiphany-game${NC}"
    echo ""
    echo "To run the game:"
    echo "  cd build && ./epiphany-game"
else
    echo -e "${GREEN}=== Configuration complete! ===${NC}"
    echo "To build, run: make -C build"
fi
