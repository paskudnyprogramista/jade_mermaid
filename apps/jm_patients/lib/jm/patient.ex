defmodule JM.Patient do
  use Ecto.Schema

  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string

    timestamps()
  end
end
