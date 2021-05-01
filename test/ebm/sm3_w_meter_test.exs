defmodule Ebm.SM3WMeterTest do
  use Ebm.DataCase

  alias Ebm.SM3WMeter

  describe "metrics" do
    alias Ebm.SM3WMeter.Metric

    @valid_attrs %{
      ept: "120.5",
      uarms: "120.5",
      pfa: "120.5",
      sb: "120.5",
      st: "120.5",
      eqc: "120.5",
      pfb: "120.5",
      sa: "120.5",
      yubuc: "120.5",
      date_time: "2010-04-17T14:00:00Z",
      yuauc: "120.5",
      pt: "120.5",
      itrms: "120.5",
      ubrms: "120.5",
      pfc: "120.5",
      pb: "120.5",
      pa: "120.5",
      eqt: "120.5",
      tpsd: "120.5",
      sc: "120.5",
      ucrms: "120.5",
      icrms: "120.5",
      eqb: "120.5",
      eqa: "120.5",
      pc: "120.5",
      qa: "120.5",
      yuaub: "120.5",
      freq: "120.5",
      pga: "120.5",
      qt: "120.5",
      iarms: "120.5",
      pft: "120.5",
      pgc: "120.5",
      qc: "120.5",
      pgb: "120.5",
      epa: "120.5",
      qb: "120.5",
      epc: "120.5",
      ibrms: "120.5"
    }
    @update_attrs %{
      ept: "456.7",
      uarms: "456.7",
      pfa: "456.7",
      sb: "456.7",
      st: "456.7",
      eqc: "456.7",
      pfb: "456.7",
      sa: "456.7",
      yubuc: "456.7",
      date_time: "2011-05-18T15:01:01Z",
      yuauc: "456.7",
      pt: "456.7",
      itrms: "456.7",
      ubrms: "456.7",
      pfc: "456.7",
      pb: "456.7",
      pa: "456.7",
      eqt: "456.7",
      tpsd: "456.7",
      sc: "456.7",
      ucrms: "456.7",
      icrms: "456.7",
      eqb: "456.7",
      eqa: "456.7",
      pc: "456.7",
      qa: "456.7",
      yuaub: "456.7",
      freq: "456.7",
      pga: "456.7",
      qt: "456.7",
      iarms: "456.7",
      pft: "456.7",
      pgc: "456.7",
      qc: "456.7",
      pgb: "456.7",
      epa: "456.7",
      qb: "456.7",
      epc: "456.7",
      ibrms: "456.7"
    }
    @invalid_attrs %{
      ept: nil,
      uarms: nil,
      pfa: nil,
      sb: nil,
      st: nil,
      eqc: nil,
      pfb: nil,
      sa: nil,
      yubuc: nil,
      date_time: nil,
      yuauc: nil,
      pt: nil,
      itrms: nil,
      ubrms: nil,
      pfc: nil,
      pb: nil,
      pa: nil,
      eqt: nil,
      tpsd: nil,
      sc: nil,
      ucrms: nil,
      icrms: nil,
      eqb: nil,
      eqa: nil,
      pc: nil,
      qa: nil,
      yuaub: nil,
      freq: nil,
      pga: nil,
      qt: nil,
      iarms: nil,
      pft: nil,
      pgc: nil,
      qc: nil,
      pgb: nil,
      epa: nil,
      qb: nil,
      epc: nil,
      ibrms: nil
    }

    def metric_fixture(attrs \\ %{}) do
      {:ok, metric} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SM3WMeter.create_metric()

      metric
    end

    test "list_metrics/0 returns all metrics" do
      metric = metric_fixture()
      assert SM3WMeter.list_metrics() == [metric]
    end

    test "get_metric!/1 returns the metric with given id" do
      metric = metric_fixture()
      assert SM3WMeter.get_metric!(metric.id) == metric
    end

    test "create_metric/1 with valid data creates a metric" do
      assert {:ok, %Metric{} = metric} = SM3WMeter.create_metric(@valid_attrs)
      assert metric.ibrms == Decimal.new("120.5")
      assert metric.epc == Decimal.new("120.5")
      assert metric.qb == Decimal.new("120.5")
      assert metric.epa == Decimal.new("120.5")
      assert metric.pgb == Decimal.new("120.5")
      assert metric.qc == Decimal.new("120.5")
      assert metric.pgc == Decimal.new("120.5")
      assert metric.pft == Decimal.new("120.5")
      assert metric.iarms == Decimal.new("120.5")
      assert metric.qt == Decimal.new("120.5")
      assert metric.pga == Decimal.new("120.5")
      assert metric.freq == Decimal.new("120.5")
      assert metric.yuaub == Decimal.new("120.5")
      assert metric.qa == Decimal.new("120.5")
      assert metric.pc == Decimal.new("120.5")
      assert metric.eqa == Decimal.new("120.5")
      assert metric.eqb == Decimal.new("120.5")
      assert metric.icrms == Decimal.new("120.5")
      assert metric.ucrms == Decimal.new("120.5")
      assert metric.sc == Decimal.new("120.5")
      assert metric.tpsd == Decimal.new("120.5")
      assert metric.eqt == Decimal.new("120.5")
      assert metric.pa == Decimal.new("120.5")
      assert metric.pb == Decimal.new("120.5")
      assert metric.pfc == Decimal.new("120.5")
      assert metric.ubrms == Decimal.new("120.5")
      assert metric.itrms == Decimal.new("120.5")
      assert metric.pt == Decimal.new("120.5")
      assert metric.yuauc == Decimal.new("120.5")
      assert metric.date_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert metric.yubuc == Decimal.new("120.5")
      assert metric.sa == Decimal.new("120.5")
      assert metric.pfb == Decimal.new("120.5")
      assert metric.eqc == Decimal.new("120.5")
      assert metric.st == Decimal.new("120.5")
      assert metric.sb == Decimal.new("120.5")
      assert metric.pfa == Decimal.new("120.5")
      assert metric.uarms == Decimal.new("120.5")
      assert metric.ept == Decimal.new("120.5")
    end

    test "create_metric/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SM3WMeter.create_metric(@invalid_attrs)
    end

    test "update_metric/2 with valid data updates the metric" do
      metric = metric_fixture()
      assert {:ok, %Metric{} = metric} = SM3WMeter.update_metric(metric, @update_attrs)
      assert metric.ibrms == Decimal.new("456.7")
      assert metric.epc == Decimal.new("456.7")
      assert metric.qb == Decimal.new("456.7")
      assert metric.epa == Decimal.new("456.7")
      assert metric.pgb == Decimal.new("456.7")
      assert metric.qc == Decimal.new("456.7")
      assert metric.pgc == Decimal.new("456.7")
      assert metric.pft == Decimal.new("456.7")
      assert metric.iarms == Decimal.new("456.7")
      assert metric.qt == Decimal.new("456.7")
      assert metric.pga == Decimal.new("456.7")
      assert metric.freq == Decimal.new("456.7")
      assert metric.yuaub == Decimal.new("456.7")
      assert metric.qa == Decimal.new("456.7")
      assert metric.pc == Decimal.new("456.7")
      assert metric.eqa == Decimal.new("456.7")
      assert metric.eqb == Decimal.new("456.7")
      assert metric.icrms == Decimal.new("456.7")
      assert metric.ucrms == Decimal.new("456.7")
      assert metric.sc == Decimal.new("456.7")
      assert metric.tpsd == Decimal.new("456.7")
      assert metric.eqt == Decimal.new("456.7")
      assert metric.pa == Decimal.new("456.7")
      assert metric.pb == Decimal.new("456.7")
      assert metric.pfc == Decimal.new("456.7")
      assert metric.ubrms == Decimal.new("456.7")
      assert metric.itrms == Decimal.new("456.7")
      assert metric.pt == Decimal.new("456.7")
      assert metric.yuauc == Decimal.new("456.7")
      assert metric.date_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert metric.yubuc == Decimal.new("456.7")
      assert metric.sa == Decimal.new("456.7")
      assert metric.pfb == Decimal.new("456.7")
      assert metric.eqc == Decimal.new("456.7")
      assert metric.st == Decimal.new("456.7")
      assert metric.sb == Decimal.new("456.7")
      assert metric.pfa == Decimal.new("456.7")
      assert metric.uarms == Decimal.new("456.7")
      assert metric.ept == Decimal.new("456.7")
    end

    test "update_metric/2 with invalid data returns error changeset" do
      metric = metric_fixture()
      assert {:error, %Ecto.Changeset{}} = SM3WMeter.update_metric(metric, @invalid_attrs)
      assert metric == SM3WMeter.get_metric!(metric.id)
    end

    test "delete_metric/1 deletes the metric" do
      metric = metric_fixture()
      assert {:ok, %Metric{}} = SM3WMeter.delete_metric(metric)
      assert_raise Ecto.NoResultsError, fn -> SM3WMeter.get_metric!(metric.id) end
    end

    test "change_metric/1 returns a metric changeset" do
      metric = metric_fixture()
      assert %Ecto.Changeset{} = SM3WMeter.change_metric(metric)
    end
  end
end
