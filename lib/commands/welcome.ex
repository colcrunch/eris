defmodule Eris.Commands.Welcome do
  require Logger

  alias Nostrum.Struct.Interaction

  @behaviour Nosedrum.ApplicationCommand

  def name(), do: "welcome"

  @impl true
  def description(), do: "Automatically welcome members to the discord."

  @impl true
  def options() do
    [
      %{
        type: :sub_command,
        name: "set_welcome",
        description: "Sets the welcome config for this server."
      },
      %{
        type: :sub_command,
        name: "get_welcome",
        description: "Gets the welcome config for this server."
      }
    ]
  end

  @impl true
  def command(%Interaction{data: %{options: [%{name: "set_welcome"}]}}), do: [content: "XX"]
  def command(%Interaction{data: %{options: [%{name: "get_welcome"}]}}), do: [content: "YY"]

  @impl true
  def type(), do: :slash
end
