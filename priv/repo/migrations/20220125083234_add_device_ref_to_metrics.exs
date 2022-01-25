defmodule Ebm.Repo.Migrations.AddDeviceRefToMetrics do
  use Ecto.Migration

  def change do
    alter table(:metrics) do
      add :device_ref, :string
    end
  end
end
