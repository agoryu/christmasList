defmodule ChristmasList.Present do
  use ChristmasList.Web, :model

  schema "presents" do
    field :label, :string
    field :link, :string
    field :comment, :string
    field :note, :integer
    belongs_to :user, ChristmasList.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:label, :link, :comment, :note])
    |> validate_required([:label, :link, :comment, :note])
  end
end
