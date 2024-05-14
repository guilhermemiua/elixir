defmodule BankWeb.UsersControllerTest do
  use BankWeb.ConnCase, async: true

  import Mox

  alias Bank.Users
  alias Users.User
  alias Bank.ViaCep.ClientMock, as: ViaCepClientMock

  setup :verify_on_exit!

  describe "create" do
    test "when there are invalid params, should return an error", %{conn: conn} do
      params = %{
        "name" => nil,
        "zip_code" => "12345678",
        "email" => "x.com",
        "password" => "1"
      }

      expect(ViaCepClientMock, :call, fn _ ->
        body = %{
          "bairro" => "",
          "cep" => "12345-678",
          "complemento" => "",
          "ddd" => "28",
          "gia" => "",
          "ibge" => "3202306",
          "localidade" => "Guaçuí",
          "logradouro" => "",
          "siafi" => "5645",
          "uf" => "ES"
        }

        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(400)

      expected_response = %{"errors" => %{
        "email" => ["has invalid format"],
        "name" => ["can't be blank"],
        "password" => ["should be at least 8 character(s)"]
      }}

      assert response == expected_response
    end

    test "should create user", %{conn: conn} do
      params = %{
        "name" => "John",
        "zip_code" => "12345678",
        "email" => "x@gmail.com",
        "password" => "12345678"
      }

      expect(ViaCepClientMock, :call, fn _ ->
        body = %{
          "bairro" => "",
          "cep" => "12345-678",
          "complemento" => "",
          "ddd" => "28",
          "gia" => "",
          "ibge" => "3202306",
          "localidade" => "Guaçuí",
          "logradouro" => "",
          "siafi" => "5645",
          "uf" => "ES"
        }

        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(201)

      assert %{
        "email" => "x@gmail.com",
        "id" => _id,
        "inserted_at" => _inserted_at,
        "name" => "John",
        "updated_at" => _inserted_at,
        "zip_code" => "12345678"
      } = response
    end
  end

  describe "delete" do
    test "should delete user", %{conn: conn} do
      params = %{
        "name" => "John",
        "zip_code" => "12345678",
        "email" => "x@gmail.com",
        "password" => "12345678"
      }

      expect(ViaCepClientMock, :call, fn _ ->
        body = %{
          "bairro" => "",
          "cep" => "12345-678",
          "complemento" => "",
          "ddd" => "28",
          "gia" => "",
          "ibge" => "3202306",
          "localidade" => "Guaçuí",
          "logradouro" => "",
          "siafi" => "5645",
          "uf" => "ES"
        }

        {:ok, body}
      end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(200)

      assert %{
        "email" => "x@gmail.com",
        "id" => id,
        "inserted_at" => _inserted_at,
        "name" => "John",
        "updated_at" => _inserted_at,
        "zip_code" => "12345678"
      } = response
    end

    test "when user doesn't exists, should return 404", %{conn: conn} do
      response =
        conn
        |> delete(~p"/api/users/910232")
        |> json_response(404)
    end
  end
end
