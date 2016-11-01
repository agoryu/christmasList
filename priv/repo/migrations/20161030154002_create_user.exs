defmodule ChristmasList.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :login, :string
      add :mdp, :string
      add :email, :string

      timestamps()
    end

  end
end
