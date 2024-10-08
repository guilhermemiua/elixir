defmodule Bank.Accounts do
  alias Bank.Accounts.Create
  alias Bank.Accounts.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
