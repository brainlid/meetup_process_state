defmodule ProcessState.DictionaryAbuse do
  @moduledoc """
  Shows an example of abusing the Process Dictionary to maintain process state.

  ## Example

      alias ProcessState.DictionaryAbuse
      DictionaryAbuse.state_1
      DictionaryAbuse.run

      DictionaryAbuse.state_2
      DictionaryAbuse.run

      DictionaryAbuse.state_3
      DictionaryAbuse.run

      :observer.start
      # view "self()" pid's Dictionary tab

      Process.put(:state, "something unsupported")
      DictionaryAbuse.run

  """
  require Logger

  def state_1 do
    Process.put(:state, :greeting)
    :ok
  end

  def state_2 do
    Process.put(:state, :count_to_10)
    :ok
  end

  def state_3 do
    Process.put(:state, :random)
    :ok
  end


  def run do
    case Process.get(:state) do
      :greeting ->
        "Hello there!"

      :count_to_10 ->
        Enum.each(1..10, fn(num) ->
          IO.puts("#{inspect num}...")
          Process.sleep(500)
        end)

      :random ->
        sayings = ["Well, that's just great.", "Sorry?", "Eh?", "Go on then!"]
        Enum.random(sayings)

      _ ->
        "Try again!"
    end
  end
end
