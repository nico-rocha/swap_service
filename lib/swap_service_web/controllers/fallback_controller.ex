defmodule SwapServiceWeb.FallbackController do
  use SwapServiceWeb, :controller

  def call(conn, {:error, error}) do
    conn
    |> put_status(404)
    |> put_view(SwapServiceWeb.ErrorView)
    |> render("400.json", result: error)
  end
end
