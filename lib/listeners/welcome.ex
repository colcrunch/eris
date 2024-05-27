defmodule Eris.Listeners.WelcomeListener do
  use Nostrum.Consumer

  require Logger

  def handle_event({:INTERACTION_CREATE, intr, _}) do
    case intr.type do
      3 -> :todo
      _ -> :noop
    end
  end
end
