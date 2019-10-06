defmodule ElixirApiTemplate.Repo do
  use Ecto.Repo,
    otp_app: :elixir_api_template,
    adapter: Ecto.Adapters.Postgres
end
