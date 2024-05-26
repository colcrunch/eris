defmodule Eris.Commands.Core.EveTime do
  require Logger

  @behaviour Nosedrum.ApplicationCommand

  def name(), do: "evetime"

  @impl true
  def description(), do: "Display the current EVE/UTC time."

  @impl true
  def command(_interaction) do
    evetime = DateTime.utc_now()
    et_string = "The current EVE (UTC) time is: **#{evetime.hour}:#{evetime.minute}**"
    [content: et_string]
  end

  @impl true
  def type(), do: :slash
end
