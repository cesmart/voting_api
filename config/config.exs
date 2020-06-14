# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :voting_api,
  ecto_repos: [VotingApi.Repo]

# Configures the endpoint
config :voting_api, VotingApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "murWnLwndYKLIGfEplLoTg4wBLv4jq9CXZUrLy35xV+jG9mX/0Z2xF4BsXFcnBXM",
  render_errors: [view: VotingApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: VotingApi.PubSub,
  live_view: [signing_salt: "+EAMTmqS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
