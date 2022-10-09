# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :dappWatch,
  ecto_repos: [DappWatch.Repo]

# Configures the endpoint
config :dappWatch, DappWatchWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DappWatchWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DappWatch.PubSub,
  live_view: [signing_salt: "dxq9X07p"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ethereumex,
  url: "http://localhost:8546",
  # client_type: :http,
  # http_options: [pool_timeout: 5000, receive_timeout: 15_000],
  http_headers: [{"Content-Type", "application/json"}]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
