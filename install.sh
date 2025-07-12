#!/bin/bash

# Auto-adapt install location: use ~/bin if no permission for /usr/local/bin
TARGET="/usr/local/bin/ccswitch"
SCRIPT="$(pwd)/cc_switch.py"

if ! touch "$TARGET" 2>/dev/null; then
  mkdir -p "$HOME/bin"
  TARGET="$HOME/bin/ccswitch"
  echo "No permission for /usr/local/bin, installing to $TARGET"
fi

# Always overwrite the target file (no duplicate installs)
echo "Overwriting $TARGET ..."
{
  echo "#!/usr/bin/env python3"
  cat "$SCRIPT"
} > "$TARGET"
chmod +x "$TARGET"

# Add ~/bin to PATH if not already
PATH_UPDATED=false
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.zshrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
    PATH_UPDATED=true
  fi
  if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    PATH_UPDATED=true
  fi
  echo "Added ~/bin to PATH in .zshrc and .bashrc"
fi

# Source the shell config to make ccswitch available immediately
CURRENT_SHELL=$(basename "$SHELL")
if [ "$PATH_UPDATED" = true ]; then
  if [ "$CURRENT_SHELL" = "zsh" ]; then
    source "$HOME/.zshrc"
  elif [ "$CURRENT_SHELL" = "bash" ]; then
    source "$HOME/.bashrc"
  fi
  echo "Sourced your shell config to update PATH. You can now use 'ccswitch' immediately."
fi

echo "ccswitch command installed at $TARGET."
echo "Usage examples:"
echo "  ccswitch --type kimi --token sk-xxx # Kimi API token"
echo "  ccswitch --type custom --token sk-xxx --base_url https://your-url.com # Custom API token and URL"
echo "  ccswitch --reset # reset to default settings"
echo "  ccswitch   # interactive mode"
