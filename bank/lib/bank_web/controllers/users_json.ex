defmodule BankWeb.UsersJSON do
  alias Bank.Users.User

  def create(%{user: user}), do: data(user)
  def get(%{user: user}), do: data(user)

  defp data(%User{} = user) do
    %{
      id: user.id,
      zip_code: user.zip_code,
      email: user.email,
      name: user.name
    }
  end
end
