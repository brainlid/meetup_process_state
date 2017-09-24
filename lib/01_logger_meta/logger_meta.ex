defmodule ProcessState.LoggerMeta do
  @moduledoc """
  Example showing basic use of Logger metadata.

  https://hexdocs.pm/logger/Logger.html

  ## Example

      alias ProcessState.LoggerMeta
      LoggerMeta.run_steps

  ## Sample Output

      18:56:46.965 pid=<0.114.0> state_1=always_here [info]  Step 1

      18:56:46.965 pid=<0.114.0> state_1=always_here [info]  Step 2

      18:56:46.965 pid=<0.114.0> state_1=always_here custom_1=set_in_step_3 [info]  Step 3
      {:ok, "Finished"}

  ## Source Code

  https://github.com/elixir-lang/elixir/blob/v1.5.1/lib/logger/lib/logger.ex#L364

      @metadata :logger_metadata
      @compile {:inline, __metadata__: 0}

      defp __metadata__ do
        Process.get(@metadata) || {true, []}
      end

  """
  require Logger

  defp setup_metadata do
    Logger.metadata(state_1: "always_here")
  end

  defp step_1 do
    Logger.info("Step 1")
  end

  defp step_2 do
    Logger.info("Step 2")
  end

  defp step_3 do
    Logger.info("Step 3", [custom_1: "set_in_step_3"])
  end


  def run_steps do
    setup_metadata()
    step_1()
    step_2()
    step_3()
    {:ok, "Finished"}
  end
end
