defmodule SwapService.GithubApi.Client do
  use Tesla

  @derive Jason.Encoder
  plug Tesla.Middleware.BaseUrl, "https://api.github.com/repos"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "nico-rocha"}]

  def get_repository(%{"user" => user, "repository" => repository}) do
    "/#{user}/#{repository}"
    |> get()
    |> handle_get()
  end

  def get_issues(issues) do
    issues
    |> String.replace("{/number}", "")
    |> get()
    |> handle_get()
  end
  def get_contributors(contributors) do
    contributors
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, %{message: "Not found!", status: 404}}
  defp handle_get({:error, _reason} = error), do: error
end
