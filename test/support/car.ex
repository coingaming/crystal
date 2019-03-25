defmodule CrystalTest.Support.Car do
  defstruct [
    :year,
    :price,
    :model
  ]

  @type t :: %__MODULE__{
    year: pos_integer | nil,
    price: pos_integer,
    model: String.t | nil
  }
end
