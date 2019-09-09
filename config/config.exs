# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :capture,
  ecto_repos: [Capture.Repo]

# Configures the endpoint
config :capture, CaptureWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KPZTE3kasos3VSe5LQ7TMxOIeX52k18lV/Bvo+C3O6lRl1oKougGUQkc2mw65c8Z",
  render_errors: [view: CaptureWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Capture.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
