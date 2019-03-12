FROM debian:stable-slim

LABEL "name"="jq"
LABEL "maintainer"="Alain Hélaïli <helaili@github.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Run jq"
LABEL "com.github.actions.description"="Run jq and send the output to a file"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="yellow"

RUN apt-get update && \
    apt-get install --no-install-recommends -y jq findutils curl ca-certificates
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
