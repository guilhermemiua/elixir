defmodule FizzBuzz do
  defp evaluate_number(number) when rem(number, 3) === 0 and rem(number, 5) === 0, do: "FizzBuzz"
  defp evaluate_number(number) when rem(number, 3) === 0, do: "Fizz"
  defp evaluate_number(number) when rem(number, 5) === 0, do: "Buzz"
  defp evaluate_number(number), do: number

  def execute(number_list) when is_list(number_list) do
    number_list
    |> Enum.map(&evaluate_number/1)
  end

  def execute(number_list), do: "Not a list"
end
