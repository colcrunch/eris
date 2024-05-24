defmodule Eris.Commands.Core.Ping do
  require Logger

  @behaviour Nosedrum.ApplicationCommand

  def name(), do: "ping"

  @impl true
  def description(), do: "Send a ping to the bot to check for signs of life."

  @impl true
  def command(_interaction), do: [content: "pong!"]

  @impl true
  def type(), do: :slash
end
