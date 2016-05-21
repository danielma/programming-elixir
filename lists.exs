defmodule MyList do
  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([ head | tail ], f), do: [ f.(head) | map(tail, f) ]

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([ head | tail ], acc, f), do: reduce(tail, f.(head, acc), f)

  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum([], _), do: 0
  def mapsum([ head | tail ], f), do: f.(head) + mapsum(tail, f)

  @spec max([[any]]) :: [any]
  def max([]) do
    nil
  end

  def max(list) do
    reduce list, 0, fn a, b ->
      if a > b, do: a, else: b
    end
  end

  def caesar(chars, n) do
    map chars, fn char ->
      wrap = char + n - 122

      if wrap >= 0 do
        char + n - 26
      else
        char + n
      end
    end
  end

  def span(min, max) when min > max, do: raise "Can't get a span where min is larger than max"
  def span(max, max), do: [max]
  def span(min, max), do: [ min | span(min + 1, max) ]
end
