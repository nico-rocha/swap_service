defmodule SwapService.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  alias SwapService.{Issue, Contributor}

  schema "repositories" do
    field :user, :string
    field :repository, :string
    has_many :contributors, Contributor, foreign_key: :repository_id
    has_many :issues, Issue, foreign_key: :repository_id
    timestamps()
  end

  @required_params [:user, :repository]

  def build(params) do
    params
    |> changeset()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(repository, params) do
    repository
    |> cast(
      %{
        user: params.user,
        repository: params.repository,
        issues: params.issues,
        contributors: params.contributors
      },
      [:user, :repository]
    )
    |> validate_required(@required_params)
    |> cast_assoc(:issues)
    |> cast_assoc(:contributors)

  end
end
