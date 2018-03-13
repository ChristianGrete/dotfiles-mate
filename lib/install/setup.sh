if [ ! -x "$(command -v -- brew 2>/dev/null)" ]
  then
    echo "$(cat <<EOF
💥  Error: The \`brew\` command cannot execute. Please make sure that Homebrew
and/or dotfiles-brew is correctly installed. Then try again.
EOF
    )" >&2

    exit 126
fi

printf '🍻  Installing Homebrew dependencies ... '

$(
  cd "$PWD/dist"

  brew bundle >/dev/null 2>&1
)

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo "💥  Error: Unable to install Homebrew dependencies." >&2

  exit 1
fi

echo
