defmodule Crystal do

  @doc """

  Checks types in given module.

  ## Example

  ```
  iex> Crystal.type_check_module(Elixir.CrystalTest.Support.FactorialFail)
  :nok

  iex> Crystal.type_check_module(Elixir.CrystalTest.Support.FactorialPass)
  :ok

  iex> Crystal.type_check_module(CrystalTest.Support.CrossModuleFail)
  :nok

  iex> Crystal.type_check_module(CrystalTest.Support.CrossModulePass)
  :ok
  ```

  """

  @spec type_check_module(atom) :: :ok | :nok
  def type_check_module(module) when is_atom(module) do
    :gradualizer.type_check_module(module)
  end

end
