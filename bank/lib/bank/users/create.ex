defmodule Bank.Users.Create do
  alias Bank.Users.User
  alias Bank.Repo

  def call(params) do
    params
    |> User.create_changeset()
    |> Repo.insert()
  end
end
