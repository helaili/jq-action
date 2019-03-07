workflow "New workflow" {
  on = "push"
  resolves = ["debug"]
}

action "debug" {
  uses = "helaili/debug-action@master"
  needs = ["Run jq"]
  args = "/github/home/test.json"
}


action "Run jq" {
  uses = "./"
  env = {
    WEBAPP_NAME = "mysampleexpressapp-actions"
    OUTPUT_FILE = "$HOME/test.json"
  }
  args = "-j '.head_commit.author.email' $GITHUB_EVENT_PATH"
}
