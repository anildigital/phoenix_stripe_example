defmodule PhoenixStripeExample.Repo.Migrations.CreateCharges do
  use Ecto.Migration

  def change do
    create table(:charges) do
      add :charge, :decimal

      timestamps()
    end

  end
end
