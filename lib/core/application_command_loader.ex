defmodule Eris.Core.ApplicationCommandLoader do
  require Logger

  alias Nosedrum.Storage.Dispatcher

  def load_all() do
    Logger.debug("GETTING")
    get_all_command_modules()
    |> filter_application_commands()
    |> queue_commands()

    register_commands()
  end

  defp get_all_command_modules() do
    :code.all_available()
    |> Enum.filter(fn {module, _, loaded} -> is_command?(module) and not loaded end)
    |> Enum.map(fn {module_charlist, _, _} -> List.to_existing_atom(module_charlist) end)
  end

  defp is_command?(module_charlist) do
    List.to_string(module_charlist)
    |> String.starts_with?("Elixir.Eris.Commands")
  end

  defp filter_application_commands(command_list) do
    Enum.filter(command_list, fn command ->
      command.module_info(:attributes)[:behaviour]
      |> Enum.member?(Nosedrum.ApplicationCommand)
    end)
  end

  defp queue_commands(commands) do
    Enum.each(commands, fn command->
      Dispatcher.queue_command(command.name, command)
      Logger.debug("Added module #{command} add command /#{command.name}")
    end)
  end

  defp register_commands() do
    Application.get_env(:eris, :guild_ids)
    |> Enum.each(fn server_id ->
      Dispatcher.process_queue(server_id)
      Logger.debug("Successfully registered application commands to #{server_id}")
    end)
  end
end
