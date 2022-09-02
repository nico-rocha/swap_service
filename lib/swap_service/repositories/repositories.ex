defmodule SwapService.Repositories do
  alias SwapService.Repository
  alias SwapService.Repo

  def create_repository({:ok, attrs}) do
    attrs
    |> Repository.build()
    |> Repo.insert()
  end

  def create_repository(error), do: {:error, error}

  def preload_children(repository) do
    repository
    |> Repo.preload(:issues)
    |> Repo.preload(:contributors)
  end
end
