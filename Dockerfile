FROM elixir:1.12.0-rc.1-alpine AS build

WORKDIR /app

COPY mix.exs mix.lock ./

RUN apk --update add inotify-tools &&\
    rm -rf /var/cache/apk/* &&\
    mix local.hex --force &&\
    mix local.rebar --force &&\
    mix deps.get

COPY . .

CMD ["mix", "phx.server"]



# MIX RELEASE
FROM elixir:1.12.0-rc.1-alpine AS release

ENV MIX_ENV=prod

COPY --from=build /root/.mix /root/.mix
COPY --from=build /app /app

WORKDIR /app

RUN mix compile &&\
    mix phx.digest &&\
    mix release



# PREPARE RELEASE IMAGE
FROM alpine:3.9 AS app

RUN apk add --no-cache openssl ncurses-libs &&\
    rm -rf /var/cache/apk/*

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=release --chown=nobody:nobody /app/_build/prod/rel/ebm ./

ENV HOME=/app

CMD ["bin/ebm", "start"]
