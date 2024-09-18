defmodule BankWeb.FallbackController do
  use BankWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(404)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(400)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, status: :bad_request)
  end

  def call(conn, {:error, :internal_server_error}) do
    conn
    |> put_status(500)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, status: :internal_server_error)
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(400)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, message}) do
    conn
    |> put_status(400)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, message: message)
  end
end
