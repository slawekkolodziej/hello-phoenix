defmodule Hello.Repo.Migrations.CreateFive do
  use Ecto.Migration

  def change do
    create table(:fives) do
      add :name, :string
      add :comment, :text

      timestamps
    end

  end
end
