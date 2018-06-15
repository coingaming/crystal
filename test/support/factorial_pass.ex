defmodule CrystalTest.Support.FactorialPass do

  @spec factorial(non_neg_integer()) :: pos_integer()

  def factorial(0), do: 1
  def factorial(n) do
    n * factorial(n - 1)
  end

end
