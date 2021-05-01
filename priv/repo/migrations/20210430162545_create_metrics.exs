defmodule Ebm.Repo.Migrations.CreateMetrics do
  use Ecto.Migration

  def change do
    create table(:metrics) do
      add :date_time, :utc_datetime
      add :pa, :decimal
      add :pb, :decimal
      add :pc, :decimal
      add :pt, :decimal
      add :qa, :decimal
      add :qb, :decimal
      add :qc, :decimal
      add :qt, :decimal
      add :sa, :decimal
      add :sb, :decimal
      add :sc, :decimal
      add :st, :decimal
      add :uarms, :decimal
      add :ubrms, :decimal
      add :ucrms, :decimal
      add :iarms, :decimal
      add :ibrms, :decimal
      add :icrms, :decimal
      add :itrms, :decimal
      add :pfa, :decimal
      add :pfb, :decimal
      add :pfc, :decimal
      add :pft, :decimal
      add :pga, :decimal
      add :pgb, :decimal
      add :pgc, :decimal
      add :freq, :decimal
      add :epa, :decimal
      add :epb, :decimal
      add :epc, :decimal
      add :ept, :decimal
      add :eqa, :decimal
      add :eqb, :decimal
      add :eqc, :decimal
      add :eqt, :decimal
      add :yuaub, :decimal
      add :yuauc, :decimal
      add :yubuc, :decimal
      add :tpsd, :decimal

      timestamps()
    end
  end
end
