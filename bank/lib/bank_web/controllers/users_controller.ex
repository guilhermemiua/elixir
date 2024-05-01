defmodule BankWeb.UsersController do
  use BankWeb, :controller

  alias Bank.Users.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(201)
    |> render(:create, user: user)
  end

  defp handle_response({:error, changeset}, conn) do
    conn
    |> put_status(400)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
