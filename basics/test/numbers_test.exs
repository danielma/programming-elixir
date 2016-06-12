defmodule NumbersTest do
  use ExUnit.Case
  doctest Numbers

  test "prime?" do
    assert(Numbers.prime?(2))
    refute(Numbers.prime?(4))
    assert(Numbers.prime?(3))
    refute(Numbers.prime?(6))
    assert(Numbers.prime?(7))
    refute(Numbers.prime?(9))
    assert(Numbers.prime?(11))
    assert(Numbers.prime?(79))
  end
end
