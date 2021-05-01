FROM elixir:1.12.0-rc.1-alpine

WORKDIR /app

COPY mix.exs .
RUN apk --update add inotify-tools &&\
    rm -rf /var/cache/apk/* &&\
    mix local.hex --force &&\
    mix local.rebar --force &&\
    mix deps.get &&\
    mix compile

COPY . .

CMD ["mix", "phx.server"]
