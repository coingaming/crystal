defmodule CrystalTest.Support.FactorialFail do

  @spec factorial(integer()) :: integer()

  def factorial(0), do: 1
  def factorial(_), do: :foo

end
