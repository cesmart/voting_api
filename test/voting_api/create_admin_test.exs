defmodule VotinApi.CreateAdminTest do
  @moduledoc false

  use VotingApi.DataCase, async: true

  alias VotingApi.{Admin, CreateAdmin}

  describe "run/1" do
    test "retorna um struct quando os parâmetros são válidos" do
      params = %{name: "Foo", email: "foo@bar.com", password: "123456"}
      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "Foo"
      assert admin.email == "foo@bar.com"
      assert admin.password_hash != "123456"
    end

    test "retorna error quando o atributo name não é informado" do
      params = %{name: "", email: "foo@bar.com", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "retorna error quando o atributo email não é informado" do
      params = %{name: "Foo", email: "", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "retorna error quando o atributo password não é informado" do
      params = %{name: "Foo", email: "foo@bar.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
