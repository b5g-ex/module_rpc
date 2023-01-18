defmodule ModuleRpc do
  @moduledoc """
  Documentation for `ModuleRpc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ModuleRpc.hello()
      :world

  """
  def hello do
    :world
  end

  def serialize_task do
    # serialize
    {module, binary, path} = :code.get_object_code(RpcTask)
    File.write("task.bin", binary)

    # ここで一旦落として、モジュールを消す。

    # deserialize
    module_remote = Module.concat(Elixir, String.to_atom("RpcTask"))
    # load binary
    binary_remote = File.read("task.bin")
    path = 'any_path.beam'
    :code.load_binary(module_remote, path, binary_remote)

    # execute
    apply(module_remote, String.to_atom("exec"), [4, 5])
  end
end
