defmodule Eris.Core.CommandHandler do
  use Nostrum.Consumer
  require Logger

  alias Eris.Core.ApplicationCommandLoader
  alias Nosedrum.Storage.Dispatcher

  def handle_event({:READY, _, _}), do: ApplicationCommandLoader.load_all()
  def handle_event({:INTERACTION_CREATE, intr, _}), do: Dispatcher.handle_interaction(intr)
  def handle_event(_), do: :noop
end
