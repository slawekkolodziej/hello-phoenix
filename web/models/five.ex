defmodule Hello.Five do
  use Hello.Web, :model

  schema "fives" do
    field :name, :string
    field :comment, :string

    timestamps
  end

  @required_fields ~w(name comment)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def count do
    query = from(u in Hello.Five, select: count(u.id))
    resp = Hello.Repo.all(query)
    hd(resp)
  end
end
