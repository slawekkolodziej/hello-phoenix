defmodule Hello.FiveTest do
  use Hello.ModelCase

  alias Hello.Five

  @valid_attrs %{comment: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Five.changeset(%Five{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Five.changeset(%Five{}, @invalid_attrs)
    refute changeset.valid?
  end
end
