defmodule VotingApi.CreateAdmin do
  @moduledoc false

  import Ecto.Changeset

  alias VotingApi.{Admin, Repo}

  def run(params) do
    %Admin{}
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> put_password()
    |> Repo.insert()
  end

  defp put_password(%Ecto.Changeset{valid?: true, changes: %{password: _}} = changeset) do
    put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(get_change(changeset, :password)))
  end

  defp put_password(changeset), do: changeset
end
