import Config
import Dotenvy

source(["#{config_env()}.env", "#{config_env()}.override.env", System.get_env()])

config :eris,
  guild_ids: [
    98270419932418048,
  ]

config :nostrum,
  token: env!("TOKEN", :string!),
  gateway_intents: :all

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :debug
