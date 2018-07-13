defmodule CrystalTest.Support.FactorialPass do

  @spec factorial(integer()) :: integer()

  def factorial(0), do: 1
  def factorial(n) do
    n * factorial(n - 1)
  end

end
