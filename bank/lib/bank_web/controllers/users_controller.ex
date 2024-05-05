defmodule BankWeb.UsersController do
  use BankWeb, :controller

  alias Bank.Users
  alias Bank.Users.User

  action_fallback BankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(201)
      |> render(:create, user: user)
    end
  end
end
