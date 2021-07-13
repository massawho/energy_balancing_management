FROM elixir:1.12.2-slim AS build

WORKDIR /app

COPY mix.exs mix.lock ./

RUN apt-get update && apt-get install -y inotify-tools &&\
    mix local.hex --force &&\
    mix local.rebar --force &&\
    mix deps.get

COPY . .

CMD ["mix", "phx.server"]



# MIX RELEASE
FROM elixir:1.12.2-slim AS release

ENV MIX_ENV=prod

COPY --from=build /root/.mix /root/.mix
COPY --from=build /app /app

WORKDIR /app

RUN mix compile &&\
    mix phx.digest &&\
    mix release



# PREPARE RELEASE IMAGE
FROM debian:buster-slim AS app

RUN apt-get update && apt-get install -y openssl &&\
    apt-get clean autoclean &&\
    apt-get autoremove --yes &&\
    rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /app

RUN chown 1000:1000 /app

USER 1000:1000

COPY --from=release --chown=1000:1000 /app/_build/prod/rel/ebm ./

ENV HOME=/app

CMD ["bin/ebm", "start"]

