defmodule CrystalTest.Support.CrossModuleFail do

  @spec hello :: atom()
  def hello do
    CrystalTest.Support.FactorialPass.factorial(10)
  end

end
