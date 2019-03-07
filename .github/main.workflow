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
  args = "-j '\"mysampleexpressapp-actions-xxxxx.azurewebsites.net\" | match(\"${WEBAPP_NAME}-(.*).azurewebsites.net\") | \"${WEBAPP_NAME}:\"+.captures[].string+ \" \"' $GITHUB_EVENT_PATH"
}
