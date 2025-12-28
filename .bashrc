# trim long paths to last 2 segments
export PROMPT_DIRTRIM=2

# function to get current Git branch
parse_git_branch() {
  git branch --show-current 2>/dev/null | sed -e "s/.*/(\0)/"
}

# colored prompt: trimmed path, Git branch, then newline with cyan ❯
PS1='\[\e[1;36m\]\w\[\e[0m\] \[\e[1;34m\]$(parse_git_branch)\[\e[0m\]\[\e[1;36m\]❯\[\e[0m\] '
