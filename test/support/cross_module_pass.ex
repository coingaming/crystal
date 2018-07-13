defmodule CrystalTest.Support.CrossModulePass do

  @spec hello :: integer()
  def hello do
    CrystalTest.Support.FactorialPass.factorial(10)
  end

end
