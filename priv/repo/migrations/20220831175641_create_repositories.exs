defmodule SwapService.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :user, :string
      add :repository, :string
      timestamps()
    end
  end
end
