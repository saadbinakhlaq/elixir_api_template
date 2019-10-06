# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_api_template,
  ecto_repos: [ElixirApiTemplate.Repo]

# Configures the endpoint
config :elixir_api_template, ElixirApiTemplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s18rT7zw0vZN1oznp+xUlKh+hCLcYRpGkaOlcgCdy3EGkWFhBsiwTM3mdDRSsLVX",
  render_errors: [view: ElixirApiTemplateWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ElixirApiTemplate.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
