defmodule Bank.Repo.Migrations.AddUniqueConstraintToAccounts do
  use Ecto.Migration

  def change do
    create unique_index(:accounts, [:user_id])
  end
end
