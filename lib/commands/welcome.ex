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
        description: "Sets the welcome config for this server.",
        options: [
          %{
            type: :channel,
            name: "welcome_channel",
            description: "The channel to send welcome messages in.",
            required: true,
          },
          %{
            type: :channel,
            name: "recruit_channel",
            description: "The channel for recruitment discussions to happen in.",
            required: true
          },
          %{
            type: :role,
            name: "grant_role",
            description: "The role to grant to those interested in joining.",
            required: true
          },
          %{
            type: :role,
            name: "recruiter_role",
            description: "The role that all recruiters will have.",
            required: true
          },
          %{
            type: :string,
            name: "message",
            description: "The message you would like to be publicly displayed to users when they join.",
            required: true
          }
        ]
      },
      %{
        type: :sub_command,
        name: "get_welcome",
        description: "Gets the welcome config for this server."
      }
    ]
  end

  @impl true
  def command(%Interaction{data: %{options: [%{name: "set_welcome"}]}} = intr) do
    IO.inspect(intr)
    [content: intr.guild_id]
  end
  def command(%Interaction{data: %{options: [%{name: "get_welcome"}]}} = _intr), do: [content: "YY"]

  @impl true
  def type(), do: :slash
end
