defmodule ProcessState.SendExample do
  @moduledoc """
  Example showing a long-running process that we can more easily inspect
  with Observer.

  While running this example, open `:observer.start` and examine the process.
  Try sending it other messages that it doesn't handle. They will show up in the
  processes "Messages" tab because they aren't being handled and removed.
  However, they aren't updated in the tab in realtime, so you may have to close
  the Process' window and reopen it to see the unhandled messages.

  ## Example

      alias ProcessState.SendExample
      pid = SendExample.run
      send(pid, {:something, "unhandled"})
      :observer.start
      # view the process' messagebox
      # try sending other messages...
      send(pid, :stop)

  """
  require Logger

  def run do
    # start a new process that waits for a :stop message
    Logger.info("Starting example process")
    spawn fn() ->
      Logger.info("SendExample process started")
      receive do
        :stop ->
          Logger.info("Received stop message")
      end
      Logger.info("Process work done. Exiting.")
    end
  end
end
