defmodule JM.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string

      timestamps()
    end
  end
end
