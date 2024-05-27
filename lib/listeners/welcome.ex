defmodule Eris.Listeners.WelcomeListener do
  use Nostrum.Consumer

  require Logger

  def handle_event({:INTERACTION_CREATE, intr, _}) do
    case intr.type do
      3 -> :todo
      _ -> :noop
    end
  end

  def handle_event({:GUILD_MEMBER_ADD, member, _}) do
    guild = elem(member, 0)
    user = elem(member, 1)
    name =
      case user.nick do
      nil -> elem(Nostrum.Api.get_user(user.user_id), 1).username
      _ -> user.nick
      end
    Logger.debug("#{name} joined #{guild}")
    IO.inspect(member)
  end
end
