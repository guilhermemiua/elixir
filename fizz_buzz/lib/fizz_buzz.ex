defmodule FizzBuzz do
  def evaluate_number(number) when rem(number, 3) === 0 and rem(number, 5) === 0, do: "fizzbuzz"
  def evaluate_number(number) when rem(number, 3) === 0, do: "fizz"
  def evaluate_number(number) when rem(number, 5) === 0, do: "buzz"
  def evaluate_number(number), do: number

  def execute(number_list) do
    number_list
    |> Enum.map(&evaluate_number/1)
  end
end
