defmodule Ebm.SM3WMeter.Device do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "devices" do
    field :device_description, :string
    field :device_ref, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:device_ref, :device_description])
    |> validate_required([:device_ref, :device_description])
  end
end
