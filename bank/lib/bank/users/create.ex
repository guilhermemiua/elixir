defmodule Bank.Users.Create do
  alias Bank.Users.User
  alias Bank.Repo
  alias Bank.ViaCep.Client, as: ViaCepClient

  def call(%{"zip_code" => zip_code} = params) do
    with {:ok, _} <- ViaCepClient.call(zip_code)  do
      params
      |> User.create_changeset()
      |> Repo.insert()
    end
  end
end
