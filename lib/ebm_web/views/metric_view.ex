defmodule EbmWeb.MetricView do
  use EbmWeb, :view
  alias EbmWeb.MetricView

  def render("index.json", %{metrics: metrics}) do
    %{data: render_many(metrics, MetricView, "metric.json")}
  end

  def render("show.json", %{metric: metric}) do
    %{data: render_one(metric, MetricView, "metric.json")}
  end

  def render("metric.json", %{metric: metric}) do
    %{
      id: metric.id,
      date_time: metric.date_time,
      pa: metric.pa,
      pb: metric.pb,
      pc: metric.pc,
      pt: metric.pt,
      qa: metric.qa,
      qb: metric.qb,
      qc: metric.qc,
      qt: metric.qt,
      sa: metric.sa,
      sb: metric.sb,
      sc: metric.sc,
      st: metric.st,
      uarms: metric.uarms,
      ubrms: metric.ubrms,
      ucrms: metric.ucrms,
      iarms: metric.iarms,
      ibrms: metric.ibrms,
      icrms: metric.icrms,
      itrms: metric.itrms,
      pfa: metric.pfa,
      pfb: metric.pfb,
      pfc: metric.pfc,
      pft: metric.pft,
      pga: metric.pga,
      pgb: metric.pgb,
      pgc: metric.pgc,
      freq: metric.freq,
      epa: metric.epa,
      epb: metric.eqb,
      epc: metric.epc,
      ept: metric.ept,
      eqa: metric.eqa,
      eqb: metric.eqb,
      eqc: metric.eqc,
      eqt: metric.eqt,
      yuaub: metric.yuaub,
      yuauc: metric.yuauc,
      yubuc: metric.yubuc,
      tpsd: metric.tpsd
    }
  end
end
