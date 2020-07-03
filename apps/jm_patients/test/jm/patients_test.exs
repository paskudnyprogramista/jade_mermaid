defmodule JM.PatientsTest do
  use ExUnit.Case
  doctest JM.Patients

  test "greets the world" do
    assert JM.Patients.hello() == :world
  end
end
