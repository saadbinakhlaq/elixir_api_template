use Mix.Config

# Configure your database
config :elixir_api_template, ElixirApiTemplate.Repo,
  username: "postgres",
  password: "postgres",
  database: "elixir_api_template_test",
  hostname: System.get_env("DB_HOST") || "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_api_template, ElixirApiTemplateWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
