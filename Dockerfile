FROM alpine:latest

RUN apk add --no-cache bash jq

WORKDIR /app

COPY data.json .
COPY team_scheduling_json.sh .

RUN chmod +x team_scheduling_json.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]


