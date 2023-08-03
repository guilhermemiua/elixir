defmodule FizzBuzz do
  defp evaluate_number(number) when rem(number, 3) === 0 and rem(number, 5) === 0, do: "fizzbuzz"
  defp evaluate_number(number) when rem(number, 3) === 0, do: "fizz"
  defp evaluate_number(number) when rem(number, 5) === 0, do: "buzz"
  defp evaluate_number(number), do: number

  def execute(number_list) do
    number_list
    |> Enum.map(&evaluate_number/1)
  end
end
