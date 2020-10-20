function git-pair() {
  template="$(git config --path commit.template)"
  coauthors="$(git log --format=format:"%aN <%ae>" | sort --ignore-case | uniq -i | fzf -m)"

  { printf "\n\n"; echo "$coauthors" | sed 's/^/Co-authored-by: /'; } > "$template"

    printf "You are now pairing with:\n${coauthors}\n"

}
