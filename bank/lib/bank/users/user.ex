defmodule Bank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__, :password_hash, :password]}
  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :zip_code, :string

    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields [:name, :password, :email, :zip_code]

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:zip_code, is: 8)
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end
