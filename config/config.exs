# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :swap_service,
  ecto_repos: [SwapService.Repo]

# Configures the endpoint
config :swap_service, SwapServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qOo8VvJ6QSSV0Uex4GUTpYBiHVlSrbFSBvoEkb30PM1epTTXM1tL6gvmo5d11NTJ",
  render_errors: [view: SwapServiceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SwapService.PubSub,
  live_view: [signing_salt: "N1zQTPto"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
