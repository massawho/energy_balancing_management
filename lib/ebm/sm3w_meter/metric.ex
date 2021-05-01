defmodule Ebm.SM3WMeter.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metrics" do
    field :date_time, :utc_datetime
    field :pa, :decimal
    field :pb, :decimal
    field :pc, :decimal
    field :pt, :decimal
    field :qa, :decimal
    field :qb, :decimal
    field :qc, :decimal
    field :qt, :decimal
    field :sa, :decimal
    field :sb, :decimal
    field :sc, :decimal
    field :st, :decimal
    field :uarms, :decimal
    field :ubrms, :decimal
    field :ucrms, :decimal
    field :iarms, :decimal
    field :ibrms, :decimal
    field :icrms, :decimal
    field :itrms, :decimal
    field :pfa, :decimal
    field :pfb, :decimal
    field :pfc, :decimal
    field :pft, :decimal
    field :pga, :decimal
    field :pgb, :decimal
    field :pgc, :decimal
    field :freq, :decimal
    field :epa, :decimal
    field :epb, :decimal
    field :epc, :decimal
    field :ept, :decimal
    field :eqa, :decimal
    field :eqb, :decimal
    field :eqc, :decimal
    field :eqt, :decimal
    field :yuaub, :decimal
    field :yuauc, :decimal
    field :yubuc, :decimal
    field :tpsd, :decimal

    timestamps()
  end

  @doc false
  def changeset(metric, attrs) do
    metric
    |> cast(attrs, [
      :date_time,
      :pa,
      :pb,
      :pc,
      :pt,
      :qa,
      :qb,
      :qc,
      :qt,
      :sa,
      :sb,
      :sc,
      :st,
      :uarms,
      :ubrms,
      :ucrms,
      :iarms,
      :ibrms,
      :icrms,
      :itrms,
      :pfa,
      :pfb,
      :pfc,
      :pft,
      :pga,
      :pgb,
      :pgc,
      :freq,
      :epa,
      :eqb,
      :epc,
      :ept,
      :eqa,
      :eqb,
      :eqc,
      :eqt,
      :yuaub,
      :yuauc,
      :yubuc,
      :tpsd
    ])
    |> validate_required([
      :date_time,
      :pa,
      :pb,
      :pc,
      :pt,
      :qa,
      :qb,
      :qc,
      :qt,
      :sa,
      :sb,
      :sc,
      :st,
      :uarms,
      :ubrms,
      :ucrms,
      :iarms,
      :ibrms,
      :icrms,
      :itrms,
      :pfa,
      :pfb,
      :pfc,
      :pft,
      :pga,
      :pgb,
      :pgc,
      :freq,
      :epa,
      :eqb,
      :epc,
      :ept,
      :eqa,
      :eqb,
      :eqc,
      :eqt,
      :yuaub,
      :yuauc,
      :yubuc,
      :tpsd
    ])
  end
end
