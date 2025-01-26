FROM alpine:3.20

RUN apk update && apk add python3

WORKDIR /app
COPY ./tools/index.html /app/
COPY ./tools/styles.css /app/
COPY ./tools/script.js /app/

CMD ["python3", "-m", "http.server", "4242"]
