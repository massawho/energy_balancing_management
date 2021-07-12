import Config

config :ebm, Ebm.Repo,
  username: System.fetch_env!("DB_USERNAME"),
  password: System.fetch_env!("DB_PASSWORD"),
  database: System.fetch_env!("DB_DATABASE"),
  hostname: System.fetch_env!("DB_HOSTNAME"),
  pool_size: String.to_integer(System.get_env("DB_POOL_SIZE") || "10")

config :ebm, EbmWeb.Endpoint,
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")
