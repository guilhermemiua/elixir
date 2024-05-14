defmodule BankWeb.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias Bank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "should return zip_code info", %{bypass: bypass} do
      zip_code = "18730780"

      expected_response =
        {:ok,
         %{
           "bairro" => "",
           "cep" => "18730-780",
           "complemento" => "",
           "ddd" => "28",
           "gia" => "",
           "ibge" => "3202306",
           "localidade" => "Guaçuí",
           "logradouro" => "",
           "siafi" => "5645",
           "uf" => "ES"
         }}

      Bypass.expect_once(bypass, "GET", "/18730780/json", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, ~s({
          "bairro": "",
          "cep": "18730-780",
          "complemento": "",
          "ddd": "28",
          "gia": "",
          "ibge": "3202306",
          "localidade": "Guaçuí",
          "logradouro": "",
          "siafi": "5645",
          "uf": "ES"
        }))
      end)

      response = bypass.port |> endpoint_url() |> Client.call(zip_code)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
