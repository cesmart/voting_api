defmodule VotingApi.Admin do
  @moduledoc """
  Admin schema
  """

  use Ecto.Schema

  schema "administrators" do
    field :email, :string, null: false
    field :name, :string, null: false
    field :password, :string, null: false, virtual: true
    field :password_hash, :string, null: false

    timestamps()
  end
end
