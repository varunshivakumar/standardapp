defmodule StandardApp.Repo do
  use Ecto.Repo,
    otp_app: :standard_app,
    adapter: Ecto.Adapters.Postgres
end
