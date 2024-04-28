defmodule BankWeb.WelcomeController do
  use BankWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{message: "Bem vindo ao Bank", status: :ok})
  end
end
