#!/usr/bin/env bash

# strip debug symbols
export RUSTFLAGS="-C strip=symbols"

# set -o xtrace -o nounset -o pipefail -o errexit

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# build statically linked binary with Rust
cargo install --locked --root "$PREFIX" --path crates/cli

# strip debug symbols
# "$STRIP" "$PREFIX/bin/moon"

# remove extra build file
rm -f "${PREFIX}/.crates.toml"
