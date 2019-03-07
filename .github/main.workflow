workflow "New workflow" {
  on = "push"
  resolves = ["Run jq"]
}

action "debug" {
  uses = "helaili/debug-action@master"
}


action "Run jq" {
  uses = "./"
  needs = ["debug"]
  env = {
    WEBAPP_NAME = "mysampleexpressapp-actions"
  }
  args = "-j '.pull_request.head.ref' $GITHUB_EVENT_PATH"
}
