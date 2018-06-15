defmodule CrystalTest.Support.FactorialFail do

  @spec factorial(non_neg_integer()) :: pos_integer()

  def factorial(0), do: 1
  def factorial(_), do: :foo

end
