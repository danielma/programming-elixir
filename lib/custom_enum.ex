defmodule CustomEnum do
  @spec all?(list, (any -> any)) :: list
  # def all?([ head | tail ], f) do
  #   if f.(head) do
  #     all?(tail, f)
  #   else
  #     false
  #   end
  # end
  # def all?([], _), do: true

  # this version has no early exit. it will go through every item no matter what
  def all?(list, f), do: filter(list, f) == list

  def each([ head | tail ], f), do: [ f.(head) | each(tail, f) ]
  def each([], _), do: []

  def map([ head | tail ], f), do: [ f.(head) | map(tail, f) ]
  def map([], _), do: []

  def filter([ head | tail ], f) do
    if f.(head) do
      [ head | filter(tail, f) ]
    else
      filter(tail, f)
    end
  end 
  def filter([], _), do: []

  def split(list, value), do: split([], list, value)
  defp split(before, [ value | tail ], value), do: { reverse([ value | before ]), tail }
  defp split(before, [ head | tail ], value), do: split([ head | before ], tail, value)

  def reverse([ head | tail ]), do: reverse(tail, [head])
  def reverse([]), do: []
  defp reverse([ head | tail ], out), do: reverse(tail, [ head | out ])
  defp reverse([], out), do: out

  def take([ head | tail ], count), do: take(tail, [head], count - 1)
  defp take(_, out, 0), do: reverse(out)
  defp take([ head | tail ], out, count), do: take(tail, [ head | out ], count - 1)

  def append([ head | tail ], last), do: append_reversed(reverse([ head | tail]), last)
  def append(value, last), do: [value | last]
  defp append_reversed([ head | tail ], last), do: append_reversed(tail, [ head | last ])
  defp append_reversed([], last), do: last

  def flatten([ head | tail ]), do: append(flatten(head), flatten(tail))
  def flatten(value), do: value
  def flatten([]), do: []
end
