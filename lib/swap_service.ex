defmodule SwapService do
  defdelegate fetch_api(params), to: SwapService.Repository.Post, as: :call
end
