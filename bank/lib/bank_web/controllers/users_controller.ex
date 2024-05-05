defmodule BankWeb.UsersController do
  use BankWeb, :controller

  alias Bank.Users.Create
  alias Bank.Users.User

  action_fallback BankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(201)
      |> render(:create, user: user)
    end
  end
end
