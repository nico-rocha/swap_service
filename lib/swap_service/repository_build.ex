defmodule SwapService.RepositoryBuild do
  alias SwapService.GithubApi.Client
  @keys [:user, :repository, :issues, :contributors]

  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  def build(%{"owner" => user, "name" => repository, "issues_url" => issues, "contributors_url" => contributors}) do
    %__MODULE__{
      user: user["login"],
      repository: repository,
      issues: handle_issues(Client.get_issues(issues)),
      contributors: handle_contributors(Client.get_contributors(contributors)),
    }
  end

  defp handle_contributors({:ok, contributors}) do
    Enum.map(contributors, fn (map) -> %{name: map["login"], user: map["id"], qtd_commits: map["contributions"]} end)
  end

  defp handle_issues({:ok, issues}) do
    Enum.map(issues, fn (map) -> %{title: map["title"], author: map["user"]["login"], labels: map["labels"]} end)
  end

end
