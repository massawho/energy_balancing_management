use Mix.Config

config :ebm, EbmWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :ebm, Ebm.Repo,
  show_sensitive_data_on_connection_error: true

config :ebm, EbmWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: System.fetch_env("SECRET_KEY_BASE")

config :ebm, EbmWeb.Endpoint, server: true
