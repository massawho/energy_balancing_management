defmodule EbmWeb.MetricController do
  use EbmWeb, :controller

  alias Ebm.SM3WMeter
  alias Ebm.SM3WMeter.Metric

  action_fallback EbmWeb.FallbackController

  def index(conn, _params) do
    metrics = SM3WMeter.list_metrics()
    render(conn, "index.json", metrics: metrics)
  end

  def create(conn, metric_params) do
    metric_params =
      metric_params
      |> put_in(["date_time"], DateTime.to_string(DateTime.utc_now()))
      |> Map.new(fn
        {"id", device_ref} -> {"device_ref", device_ref}
        pair -> pair
      end)

    with {:ok, %Metric{} = metric} <- SM3WMeter.create_metric(metric_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.metric_path(conn, :show, metric))
      |> render("show.json", metric: metric)
    end
  end

  def show(conn, %{"id" => id}) do
    metric = SM3WMeter.get_metric!(id)
    render(conn, "show.json", metric: metric)
  end

  def delete(conn, %{"id" => id}) do
    metric = SM3WMeter.get_metric!(id)

    with {:ok, %Metric{}} <- SM3WMeter.delete_metric(metric) do
      send_resp(conn, :no_content, "")
    end
  end
end
