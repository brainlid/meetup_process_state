defmodule ProcessState.SpawnBasic do
  @moduledoc """
  Shows an example of recomended state management using recursion.

  ## Example

      alias ProcessState.SpawnBasic
      pid = SpawnBasic.start(%{counter: 0})
      send(pid, {:add, 10})
      send(pid, {:add, 1})
      send(pid, {:add, 2})

  """
  require Logger

  def start(initial_state) do
    Logger.info("Starting separate process with initial state: #{inspect initial_state}")
    spawn __MODULE__, :main_loop, [initial_state]
  end

  def main_loop(state) do
    Logger.info("main_loop state: #{inspect state}")
    new_state =
      receive do
        {:add, increment} ->
          Logger.info("Received :add message: #{inspect increment}")
          add(state, increment)
        _ ->
          Logger.info("Received some other message. State unchanged.")
          state
      end
    main_loop(new_state)
  end

  defp add(%{counter: current} = _state, increment) do
    %{counter: current + increment}
  end

end
