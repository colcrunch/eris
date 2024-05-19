import Config
import Dotenvy

source(["#{config_env()}.env", "#{config_env()}.override.env", System.get_env()])

config :nostrum,
  token: env!("TOKEN", :string!),
  gateway_intents: [
    :all,
  ]
