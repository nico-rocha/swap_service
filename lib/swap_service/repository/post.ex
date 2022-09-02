defmodule SwapService.Repository.Post do

  alias SwapService.GithubApi.Client
  alias SwapService.RepositoryBuild

  def call(params) do
    params
    |> Client.get_repository()
    |> handle_response()
  end

  def handle_response({:ok, repository}), do: {:ok, RepositoryBuild.build(repository)}
  def handle_response({:error, {:message, status: 404}} = error), do: error
  def handle_response({:error, _reason} = error), do: error
end
