defmodule SwapService.Repo do
  use Ecto.Repo,
    otp_app: :swap_service,
    adapter: Ecto.Adapters.Postgres
end
