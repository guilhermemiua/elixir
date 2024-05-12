defmodule Bank.Users.Update do
  alias Bank.Users.User
  alias Bank.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.update_changeset(params)
    |> Repo.update()
  end
end
