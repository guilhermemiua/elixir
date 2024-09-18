defmodule Bank.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bank.Users.User

  @required_fields [:balance, :user_id]

  @derive {Jason.Encoder, except: [:__meta__, :user]}
  schema "accounts" do
    field :balance, :decimal

    belongs_to :user, User

    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, params) do
    account
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> check_constraint(:balance, name: :balance_must_be_positive)
  end
end
