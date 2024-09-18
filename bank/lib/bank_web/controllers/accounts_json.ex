defmodule BankWeb.AccountsJSON do
  def create(%{account: account}), do: account

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{
      from_account: from_account,
      to_account: to_account
    }
  end
end
