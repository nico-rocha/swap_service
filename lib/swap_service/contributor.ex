defmodule SwapService.Contributor do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}

  alias SwapService.Repository
  alias SwapService.Repo

  schema "contributors" do
    field :name, :string
    field :user, :integer
    field :qtd_commits, :integer
    belongs_to :repository, Repository
  end

  @required_params [:name, :user, :qtd_commits]

  def changeset(contributor, params) do
    contributor
    |> Repo.preload(:repository)
    |> cast(params, [:name, :user, :qtd_commits])
    |> validate_required(@required_params)
  end
end
