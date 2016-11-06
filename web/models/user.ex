defmodule ChristmasList.User do
  use ChristmasList.Web, :model

  schema "users" do
    field :login, :string, unique: true
    field :mdp, :string
    field :email, :string

    has_many :presents, ChristmasList.Present
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:login, :mdp, :email])
    |> validate_required([:login, :mdp])
  end
end
