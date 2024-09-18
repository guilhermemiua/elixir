defmodule Bank.Accounts do
  alias Bank.Accounts.Create

  defdelegate create(params), to: Create, as: :call
end
