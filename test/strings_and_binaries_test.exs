defmodule MyStringTest do
  use ExUnit.Case
  doctest MyString

  test "printable?" do
    assert(MyString.printable?('abcdefg'))
    assert(MyString.printable?('`~)@$_($@'))
    refute(MyString.printable?('hello there ⌘'))
  end

  test "anagram?" do
    assert(MyString.anagram?('car', 'rac'))
    refute(MyString.anagram?('rat', 'ran'))
    assert(MyString.anagram?('racecar', 'carcare'))
  end

  test "first_num" do
    assert(MyString.first_num('123 + 37') == 123)
    assert(MyString.first_num('994*24') == 994)
  end

  test "last_num" do
    assert(MyString.last_num('123 + 37') == 37)
    assert(MyString.last_num('994*24') == 24)
  end

  test "calculate" do
    assert(MyString.calculate('123 + 37') == 160)
    assert(MyString.calculate('90 * 2') == 180)
    assert(MyString.calculate('10 / 5') == 2)
    assert(MyString.calculate('5 - 2') == 3)
  end
end  
