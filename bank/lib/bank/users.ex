defmodule Bank.Users do
  alias Bank.Users.Create
  alias Bank.Users.Get
  alias Bank.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
