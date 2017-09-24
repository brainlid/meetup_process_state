use Mix.Config

config :logger, :console,
  metadata: [:pid, :state_1, :custom_1, :custom_2]
  # metadata: :all
