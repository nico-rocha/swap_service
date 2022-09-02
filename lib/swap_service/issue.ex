defmodule SwapService.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}

  alias SwapService.Repository
  alias SwapService.Repo

  schema "issues" do
    field :title, :string
    field :author, :string
    field :labels, {:array, :string}
    belongs_to :repository, Repository
  end

  @required_params [:title, :author, :labels]

  def changeset(repository, params) do
    repository
    |> Repo.preload(:repository)
    |> cast(params, [:title, :author, :labels])
    |> validate_required(@required_params)
  end
end
