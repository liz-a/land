require 'sneakers'
require 'sneakers/handlers/maxretry'

Sneakers.configure(
  exchange: 'slack_pokemon',
  exchange_type: :topic,
  handler: Sneakers::Handlers::Maxretry,
  workers: 1,
)
