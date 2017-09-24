defmodule ProcessState.GenServerState do
  @moduledoc """
  Example showing recommended state management with a GenServer.

  ## Example

      alias ProcessState.GenServerState
      {:ok, pid} = GenServerState.start(%{counter: 0})
      GenServerState.add(pid, 10)
      GenServerState.add(pid, 11)
      :observer.start
      # examine the "state" of the process

  """
  require Logger
  use GenServer

  #
  # Client
  #

  def start(initial_state) do
    Logger.info("Starting genserver with initial state: #{inspect initial_state}")
    GenServer.start(__MODULE__, initial_state)
  end

  def add(pid, increment) do
    Logger.info("Sending :add message")
    GenServer.call(pid, {:add, increment})
  end

  #
  # Server (callbacks)
  #

  def handle_call({:add, increment}, _from, %{counter: current} = _state) do
    Logger.info("Adding #{inspect increment} to state.")
    new_state = %{counter: current + increment}
    Logger.info("New state is #{inspect new_state}")
    {:reply, current + increment, new_state}
  end

end
