defmodule ChristmasList.Repo.Migrations.CreatePresent do
  use Ecto.Migration

  def change do
    create table(:presents) do
      add :label, :string
      add :link, :string
      add :comment, :string
      add :note, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:presents, [:user_id])

  end
end
