#!/usr/bin/env bash

echo "Checking and installing LSP servers and tools..."

require() {
  if ! command -v "$1" &>/dev/null; then
    echo "$1 not found. Aborting."
    exit 1
  fi
}

require npm
require cargo

# JS/TS
if ! command -v typescript-language-server &>/dev/null; then
  echo "Installing TypeScript LSP..."
  npm install -g typescript typescript-language-server eslint prettier
else
  echo "TypeScript LSP already installed"
fi

# Rust
if ! command -v rust-analyzer &>/dev/null; then
  echo "Installing rust-analyzer..."
  cargo install --locked rust-analyzer
else
  echo "rust-analyzer already installed"
fi

# Lua
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v lua-language-server &>/dev/null; then
    echo "Installing lua-language-server (Homebrew)..."
    brew install lua-language-server stylua
  else
    echo "lua-language-server already installed"
  fi
else
  sudo apt install -y lua-language-server
  cargo install stylua
fi

echo "LSP and dev tools ready."

