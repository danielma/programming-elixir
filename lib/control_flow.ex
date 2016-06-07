defmodule ControlFlow do
  # implement fizzbuzz with case
  def fizzbuzz(lower, upper) when lower - 1 == upper, do: []
  def fizzbuzz(lower, upper) when lower <= upper, do: [ _fizzbuzz(lower) | fizzbuzz(lower + 1, upper) ]

  defp _fizzbuzz(value) do
    case { rem(value, 3), rem(value, 5) } do
      { 0, 0 } -> "FizzBuzz"
      { 0, _ } -> "Fizz"
      { _, 0 } -> "Buzz"
      _ -> value
    end
  end
end
