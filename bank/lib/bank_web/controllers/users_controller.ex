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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(200)
      |> render(:get, user: user)
    end
  end
end
