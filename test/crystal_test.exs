defmodule CrystalTest do
  use ExUnit.Case
  doctest Crystal

  test "greets the world" do
    assert Crystal.hello() == :world
  end
end
