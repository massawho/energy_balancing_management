defmodule Ebm.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :device_ref, :string
      add :device_description, :string

      timestamps()
    end
  end
end
