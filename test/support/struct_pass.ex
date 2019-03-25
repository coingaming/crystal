defmodule CrystalTest.Support.StructPass do
  require CrystalTest.Support.Car, as: Car

  @spec can_buy?(Car.t, pos_integer) :: boolean
  def can_buy?(%Car{price: price}, money) when (price <= money), do: true
  def can_buy?(%Car{}, _), do: false
end
