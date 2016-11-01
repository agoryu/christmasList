defmodule ChristmasList.PresentTest do
  use ChristmasList.ModelCase

  alias ChristmasList.Present

  @valid_attrs %{comment: "some content", label: "some content", link: "some content", note: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Present.changeset(%Present{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Present.changeset(%Present{}, @invalid_attrs)
    refute changeset.valid?
  end
end
