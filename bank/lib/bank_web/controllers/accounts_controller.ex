defmodule BankWeb.AccountsController do
  use BankWeb, :controller

  alias Bank.Accounts
  alias Bank.Accounts.Account

  action_fallback BankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(201)
      |> render(:create, account: account)
    end
  end
end
