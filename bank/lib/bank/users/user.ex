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

  @required_create_fields [:name, :password, :email, :zip_code]
  @update_fields [:name, :password, :email, :zip_code]

  def create_changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_create_fields)
    |> validate_required(@required_create_fields)
    |> do_validations()
    |> add_password_hash()
  end

  def update_changeset(user, params) do
    user
    |> cast(params, @update_fields)
    |> do_validations()
    |> add_password_hash()
  end

  defp do_validations(changeset) do
    changeset
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:zip_code, is: 8)
    |> unique_constraint(:email)
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end
