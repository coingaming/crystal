defmodule CrystalTest.Support.StructFail do
  require CrystalTest.Support.Car, as: Car

  @spec set_price(Car.t, float) :: Car.t
  def set_price(%Car{} = car, price), do: %Car{car | price: price}
end
