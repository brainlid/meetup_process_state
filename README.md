# ProcessState

Examples of using Elixir Processes to store and manage state. Includes lesser
known Process Dictionary. I used this for presenting at an [Utah Elixir
meetup](https://www.meetup.com/preview/utah-elixir/events/242717604).

## Using

Clone or download the repo.

Experiment in IEx and using your preferred editor.

`iex -S mix`

Example of using the `ProcessState.SpawnBasic` example.

```elixir
alias ProcessState.SpawnBasic
pid = SpawnBasic.start(%{counter: 0})
send(pid, {:add, 10})
send(pid, {:add, 1})
send(pid, {:add, 2})
```

## Explanation

I customized Logger output to include some metadata information. Then I use
`Logger.info` to log out information. The logger customization is in
`config/config.exs`.

See the examples directories and single files under the numbered directories.
