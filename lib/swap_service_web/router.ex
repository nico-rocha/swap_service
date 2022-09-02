defmodule SwapServiceWeb.Router do
  use SwapServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: SwapServiceWeb.Telemetry
    end
  end
  scope "/api", SwapServiceWeb do
    pipe_through :api

    post "/repository", SwapServiceController, :create
  end
end
