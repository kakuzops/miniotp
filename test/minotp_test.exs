defmodule MinotpTest do
  use ExUnit.Case
  doctest Minotp

  test "greets the world" do
    assert Minotp.hello() == :world
  end
end
