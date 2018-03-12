export MATE_PACKAGE="$DOTFILES_PACKAGES/dotfiles-mate"
export MATE_PACKAGE_SOURCES="$MATE_PACKAGE/dist"
export MATE_PACKAGE_VERSION="$(
  cd "$MATE_PACKAGE"

  git describe --tags "$(git rev-list --max-count=1 --tags)" 2>/dev/null

  [ $? -ne 0 ] && echo 'Unversioned'
)"

if available mate >/dev/null 2>&1
  then
    . "$MATE_PACKAGE_SOURCES/env"

    . "$MATE_PACKAGE_SOURCES/lib/m.sh"
fi
