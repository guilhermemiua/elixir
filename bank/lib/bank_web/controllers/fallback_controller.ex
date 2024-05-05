defmodule BankWeb.FallbackController do
  use BankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(400)
    |> put_view(json: BankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
