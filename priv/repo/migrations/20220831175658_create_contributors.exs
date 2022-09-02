defmodule SwapService.Repo.Migrations.CreateContributors do
  use Ecto.Migration

  def change do
    create table(:contributors) do
      add :name, :string
      add :user, :integer
      add :qtd_commits, :integer
      add :repository_id, references(:repositories)
    end
  end
end
