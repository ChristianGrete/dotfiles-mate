m () {
  if [ -z "$1" ]
    then
      "$VISUAL" .
  elif [ -d "$1" ]
    then
      cd "$1" && "$VISUAL" .
  else
     "$VISUAL" "$@"
  fi
}
