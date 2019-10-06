# Elixir + Phoenix

FROM elixir:1.9.1-alpine

RUN apk update
RUN apk --no-cache --update add \
  make \
  g++ \
  wget \
  curl \
  bash \
  inotify-tools \
  postgresql-client

ENV PHOENIX_VERSION=1.4.9
# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new $PHOENIX_VERSION


WORKDIR /app
EXPOSE 4000