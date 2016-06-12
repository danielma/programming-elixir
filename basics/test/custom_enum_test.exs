defmodule CustomEnumTest do
  use ExUnit.Case
  doctest CustomEnum

  test "all?" do
    assert(CustomEnum.all?([1, 2, 3], &(&1 >= 1)))
    assert(CustomEnum.all?([2, 4, 6], &(rem(&1, 2) == 0)))
    refute(CustomEnum.all?([1, 2, 3], &(&1 < 2)))
  end

  test "filter" do
    assert(CustomEnum.filter([1,2,3], &(&1 < 2)) == [1])
    assert(CustomEnum.filter([1,2,3,2], &(&1 == 2)) == [2,2])
  end

  test "split" do
    assert(CustomEnum.split([1,2,3,4,5,3,4], 3) == {[1,2,3], [4,5,3,4]})
    assert(CustomEnum.split([1,2,3], 2) == {[1,2], [3]})
  end

  test "reverse" do
    assert(CustomEnum.reverse([1,2,3,4]) == [4,3,2,1])
  end
  
  test "take" do
    assert(CustomEnum.take([1,2,3,4], 3) == [1,2,3])
    assert(CustomEnum.take([1,2,3], 1) == [1])
  end

  test "append" do
    assert(CustomEnum.append([1,2,3], [4,5]) == [1,2,3,4,5])
  end

  @tag :pending
  test "inner_flatten" do
    assert(CustomEnum.inner_flatten(1, []) == [1])
    assert(CustomEnum.inner_flatten([1,2], []) == [1, 2])
    assert(CustomEnum.inner_flatten([1], []) == [1])
    assert(CustomEnum.inner_flatten([[1]], []) == [1])
    assert(CustomEnum.inner_flatten([[1], 2], []) == [1,2])
  end
  
  test "flatten" do
    assert(CustomEnum.flatten([[1], 2]) == [1,2])
    assert(CustomEnum.flatten([[1, 2], 2]) == [1,2,2])
    assert(CustomEnum.flatten([[1], [2], 3]) == [1,2,3])
    assert(CustomEnum.flatten([1,2]) == [1,2])
    assert(CustomEnum.flatten([[1], 2]) == [1,2])
    assert(CustomEnum.flatten([ [1], [2] ]) == [1,2])
    assert(CustomEnum.flatten([ [ 3, [ 4 ] ] ]) == [3, 4])
    assert(CustomEnum.flatten([[2,3,[4]]]) == [2,3,4])
    assert(CustomEnum.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]]) == [1,2,3,4,5,6])
  end
end

