defmodule PhoenixStripeExample.Charges.Charge do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixStripeExample.Charges.Charge


  schema "charges" do
    field :charge, :decimal

    timestamps()
  end

  @doc false
  def changeset(%Charge{} = charge, attrs) do
    charge
    |> cast(attrs, [:charge])
    |> validate_required([:charge])
  end
end
