defmodule Eris do
  @moduledoc """
  Documentation for `Eris`.
  """
  use Application

  require Logger

  def start(_type, _args) do
    children = [
      Nosedrum.Storage.Dispatcher,
      Eris.Core.CommandHandler
    ]

    listeners = Eris.Core.ListenerLoader.load_all()
    children = children ++ listeners

    options = [strategy: :one_for_one, name: Eris.Supervisor]
    Supervisor.start_link(children, options)
  end

end
