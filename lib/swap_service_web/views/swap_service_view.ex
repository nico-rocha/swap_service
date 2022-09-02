defmodule SwapServiceWeb.SwapServiceView do
  use SwapServiceWeb, :view

  def render("create.json", %{repositories: repository}) do
    %{
      id: repository.id,
      user: repository.user,
      repository: repository.repository,
      issues: Enum.map(repository.issues, fn item -> %{title: item.title, author: item.author, labels: item.labels} end),
      contributors: Enum.map(repository.contributors, fn item -> %{name: item.name, user: item.user, qtd_commits: item.qtd_commits} end)
    }
  end
end
