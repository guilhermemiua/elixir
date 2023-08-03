defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "execute/1" do
    test "when a valid list is provided, return a list of FizzBuzz" do
      expected_response = [1, "Fizz", "Buzz", 8, "Buzz", "FizzBuzz"]

      response = FizzBuzz.execute([1, 3, 5, 8, 10, 15])
      IO.puts(response)

      assert response == expected_response
    end

    test "when an invalid list is provided, return an error message" do
      expected_response = "Not a list"

      response = FizzBuzz.execute(nil)

      assert response == expected_response
    end
  end
end
