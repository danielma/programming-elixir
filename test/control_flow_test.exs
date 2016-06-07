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

  test "ok!" do
    assert(ControlFlow.ok!({ :ok, "value" }) == "value")
    assert(ControlFlow.ok!({ :ok, 99 }) == 99)
    assert_raise(RuntimeError, "Expected {:ok, data}, but instead was {:wut, \"my finger hurts\"}", fn ->
      ControlFlow.ok!({ :wut, "my finger hurts" })
    end)
    assert_raise(RuntimeError, "Expected {:ok, data}, but instead was 6", fn ->
      ControlFlow.ok!(6)
    end)
    assert_raise(RuntimeError, "Expected {:ok, data}, but instead was {:error, :enoent}", fn ->
      ControlFlow.ok!(File.open("__pleasedontexist.txt__"))
    end)
  end
end
