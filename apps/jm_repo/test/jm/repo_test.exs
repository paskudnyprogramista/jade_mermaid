defmodule JM.RepoTest do
  use ExUnit.Case
  doctest JM.Repo

  test "greets the world" do
    assert JM.Repo.hello() == :world
  end
end
