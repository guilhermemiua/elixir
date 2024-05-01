defmodule BankWeb.UsersJSON do
  def create(%{user: user}) do
    %{
      id: user.id,
      zip_code: user.zip_code,
      email: user.email,
      name: user.name
    }
  end
end
