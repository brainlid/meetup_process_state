defmodule ProcessStateTest do
  use ExUnit.Case
  doctest ProcessState

  test "greets the world" do
    assert ProcessState.hello() == :world
  end
end
