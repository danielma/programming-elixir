assert = fn
  true -> nil
  _ -> raise "not truthy"
end

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

fz = fn
  n -> fizzbuzz.(rem(n, 3), rem(n,5), n)
end

assert.(fizzbuzz.(0, 0, 9) == "FizzBuzz")
assert.(fizzbuzz.(0, 4, 4) == "Fizz")
assert.(fizzbuzz.(9, 0, 4) == "Buzz")
assert.(fizzbuzz.(4, 4, 123) == 123)

IO.puts(fz.(10))
IO.puts(fz.(11))
IO.puts(fz.(12))
IO.puts(fz.(13))
IO.puts(fz.(14))
IO.puts(fz.(15))
IO.puts(fz.(16))

prefix = fn str ->
  fn str2 ->
    "#{str} #{str2}"
  end
end

prefix2 = &("#{&1} #{&("#{str} #{&1}")}")

mrs = prefix.("Mrs")
assert.(mrs.("Smith") == "Mrs Smith")
assert.(prefix.("Elixir").("Rocks") == "Elixir Rocks")

mrs = prefix2.("Mrs")
assert.(mrs.("Smith") == "Mrs Smith")
assert.(prefix2.("Elixir").("Rocks") == "Elixir Rocks")
