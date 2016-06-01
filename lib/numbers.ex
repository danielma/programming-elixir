defmodule Numbers do
  def prime?(1), do: true
  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(number) do
    cond do
      rem(number, 2) == 0 -> false
      rem(number, 3) == 0 -> false
      true -> true
    end
  end
end
