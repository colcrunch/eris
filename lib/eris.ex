defmodule Eris do
  @moduledoc """
  Documentation for `Eris`.
  """
  use Application

  def start(_type, _args) do
    children = [
      Nosedrum.Storage.Dispatcher,
      Eris.Core.CommandHandler
    ]

    options = [strategy: :one_for_one, name: Eris.Supervisor]
    Supervisor.start_link(children, options)
  end

end
