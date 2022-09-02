defmodule SwapServiceWeb.SwapServiceController do
  use SwapServiceWeb, :controller
  alias SwapService.Repositories

  action_fallback SwapServiceWeb.FallbackController

  def create(conn, params) do
    params
    |> SwapService.fetch_api()
    |> Repositories.create_repository()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, repository}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, repositories: Repositories.preload_children(repository))
  end

  defp handle_response({:error, error}, _conn, _view, _status), do: error
end
