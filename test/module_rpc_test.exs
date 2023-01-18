defmodule ModuleRpcTest do
  use ExUnit.Case
  doctest ModuleRpc

  test "greets the world" do
    assert ModuleRpc.hello() == :world
  end
end
