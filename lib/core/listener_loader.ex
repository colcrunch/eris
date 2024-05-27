defmodule Eris.Core.ListenerLoader do
  require Logger

  def load_all() do
    Logger.debug("Getting Listeners")
    get_all_listener_modules()
  end

  defp get_all_listener_modules() do
    :code.all_available()
    |> Enum.filter(fn {module, _, _} -> is_listener?(module) end)
    |> Enum.map(fn {module_charlist, _, _} -> List.to_existing_atom(module_charlist) end)
  end

  defp is_listener?(module_charlist) do
    List.to_string(module_charlist)
    |> String.starts_with?("Elixir.Eris.Listeners")
  end
end
