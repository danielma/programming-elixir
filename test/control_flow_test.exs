defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test "fizzbuzz" do
    assert(ControlFlow.fizzbuzz(1, 1) == [1])
    assert(ControlFlow.fizzbuzz(2, 3) == [2, "Fizz"])
    assert(ControlFlow.fizzbuzz(4, 7) == [4, "Buzz", "Fizz", 7])
    assert(
      ControlFlow.fizzbuzz(5, 15) ==
             ["Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
    )
  end
end
