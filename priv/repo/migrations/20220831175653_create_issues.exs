defmodule SwapService.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :title, :string
      add :author, :string
      add :labels, {:array, :string}
      add :repository_id, references(:repositories)
    end
  end
end
