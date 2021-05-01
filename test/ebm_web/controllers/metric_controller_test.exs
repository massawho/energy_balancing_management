defmodule EbmWeb.MetricControllerTest do
  use EbmWeb.ConnCase

  alias Ebm.SM3WMeter
  alias Ebm.SM3WMeter.Metric

  @create_attrs %{
    ibrms: "120.5",
    epc: "120.5",
    qb: "120.5",
    epa: "120.5",
    pgb: "120.5",
    qc: "120.5",
    pgc: "120.5",
    pft: "120.5",
    iarms: "120.5",
    qt: "120.5",
    pga: "120.5",
    freq: "120.5",
    yuaub: "120.5",
    qa: "120.5",
    pc: "120.5",
    eqa: "120.5",
    eqb: "120.5",
    icrms: "120.5",
    ucrms: "120.5",
    sc: "120.5",
    tpsd: "120.5",
    eqt: "120.5",
    pa: "120.5",
    pb: "120.5",
    pfc: "120.5",
    ubrms: "120.5",
    itrms: "120.5",
    pt: "120.5",
    yuauc: "120.5",
    date_time: "2010-04-17T14:00:00Z",
    yubuc: "120.5",
    sa: "120.5",
    pfb: "120.5",
    eqc: "120.5",
    st: "120.5",
    sb: "120.5",
    pfa: "120.5",
    uarms: "120.5",
    ept: "120.5"
  }
  @update_attrs %{
    ibrms: "456.7",
    epc: "456.7",
    qb: "456.7",
    epa: "456.7",
    pgb: "456.7",
    qc: "456.7",
    pgc: "456.7",
    pft: "456.7",
    iarms: "456.7",
    qt: "456.7",
    pga: "456.7",
    freq: "456.7",
    yuaub: "456.7",
    qa: "456.7",
    pc: "456.7",
    eqa: "456.7",
    eqb: "456.7",
    icrms: "456.7",
    ucrms: "456.7",
    sc: "456.7",
    tpsd: "456.7",
    eqt: "456.7",
    pa: "456.7",
    pb: "456.7",
    pfc: "456.7",
    ubrms: "456.7",
    itrms: "456.7",
    pt: "456.7",
    yuauc: "456.7",
    date_time: "2011-05-18T15:01:01Z",
    yubuc: "456.7",
    sa: "456.7",
    pfb: "456.7",
    eqc: "456.7",
    st: "456.7",
    sb: "456.7",
    pfa: "456.7",
    uarms: "456.7",
    ept: "456.7"
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

  def fixture(:metric) do
    {:ok, metric} = SM3WMeter.create_metric(@create_attrs)
    metric
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all metrics", %{conn: conn} do
      conn = get(conn, Routes.metric_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create metric" do
    test "renders metric when data is valid", %{conn: conn} do
      conn = post(conn, Routes.metric_path(conn, :create), metric: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.metric_path(conn, :show, id))

      assert %{
               "id" => id,
               "ucrms" => "120.5",
               "eqc" => "120.5",
               "iarms" => "120.5",
               "pgc" => "120.5",
               "pb" => "120.5",
               "qc" => "120.5",
               "pfb" => "120.5",
               "st" => "120.5",
               "icrms" => "120.5",
               "pft" => "120.5",
               "qt" => "120.5",
               "eqa" => "120.5",
               "sa" => "120.5",
               "eqt" => "120.5",
               "qa" => "120.5",
               "pfc" => "120.5",
               "ubrms" => "120.5",
               "epc" => "120.5",
               "sc" => "120.5",
               "freq" => "120.5",
               "pt" => "120.5",
               "pa" => "120.5",
               "eqb" => "120.5",
               "ibrms" => "120.5",
               "tpsd" => "120.5",
               "itrms" => "120.5",
               "pfa" => "120.5",
               "yuaub" => "120.5",
               "pc" => "120.5",
               "date_time" => "2010-04-17T14:00:00Z",
               "yubuc" => "120.5",
               "sb" => "120.5",
               "uarms" => "120.5",
               "qb" => "120.5",
               "yuauc" => "120.5",
               "ept" => "120.5",
               "epa" => "120.5",
               "pgb" => "120.5",
               "pga" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.metric_path(conn, :create), metric: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update metric" do
    setup [:create_metric]

    test "renders metric when data is valid", %{conn: conn, metric: %Metric{id: id} = metric} do
      conn = put(conn, Routes.metric_path(conn, :update, metric), metric: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.metric_path(conn, :show, id))

      assert %{
               "id" => id,
               "ucrms" => "456.7",
               "eqc" => "456.7",
               "iarms" => "456.7",
               "pgc" => "456.7",
               "pb" => "456.7",
               "qc" => "456.7",
               "pfb" => "456.7",
               "st" => "456.7",
               "icrms" => "456.7",
               "pft" => "456.7",
               "qt" => "456.7",
               "eqa" => "456.7",
               "sa" => "456.7",
               "eqt" => "456.7",
               "qa" => "456.7",
               "pfc" => "456.7",
               "ubrms" => "456.7",
               "epc" => "456.7",
               "sc" => "456.7",
               "freq" => "456.7",
               "pt" => "456.7",
               "pa" => "456.7",
               "eqb" => "456.7",
               "ibrms" => "456.7",
               "tpsd" => "456.7",
               "itrms" => "456.7",
               "pfa" => "456.7",
               "yuaub" => "456.7",
               "pc" => "456.7",
               "date_time" => "2011-05-18T15:01:01Z",
               "yubuc" => "456.7",
               "sb" => "456.7",
               "uarms" => "456.7",
               "qb" => "456.7",
               "yuauc" => "456.7",
               "ept" => "456.7",
               "epa" => "456.7",
               "pgb" => "456.7",
               "pga" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, metric: metric} do
      conn = put(conn, Routes.metric_path(conn, :update, metric), metric: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete metric" do
    setup [:create_metric]

    test "deletes chosen metric", %{conn: conn, metric: metric} do
      conn = delete(conn, Routes.metric_path(conn, :delete, metric))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.metric_path(conn, :show, metric))
      end
    end
  end

  defp create_metric(_) do
    metric = fixture(:metric)
    %{metric: metric}
  end
end
