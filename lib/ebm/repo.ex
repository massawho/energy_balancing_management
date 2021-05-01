defmodule Ebm.Repo do
  use Ecto.Repo,
    otp_app: :ebm,
    adapter: Ecto.Adapters.Postgres
end
