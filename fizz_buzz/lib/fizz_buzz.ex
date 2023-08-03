defmodule FizzBuzz do
  def evaluate_number(number) do
    cond do
      rem(number, 3) === 0 and rem(number, 5) === 0 -> "fizzbuzz"
      rem(number, 3) === 0 -> "fizz"
      rem(number, 5) === 0 -> "buzz"
      true -> number
    end
  end

  def execute(number_list) do
    number_list
    |> Enum.map(&evaluate_number/1)
  end
end
