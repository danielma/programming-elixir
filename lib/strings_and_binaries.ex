defmodule MyString do
  def printable?([ head | tail ]) when head in 32..?~, do: printable?(tail)
  def printable?([]), do: true
  def printable?(_), do: false

  def anagram?(first, second) do
    Enum.sort(first) == Enum.sort(second)
  end

  def calculate(list), do: _calculate(first_num(list), operator(list), last_num(list))
  defp _calculate(first, operand, second) when operand == ?-, do: first - second
  defp _calculate(first, operand, second) when operand == ?+, do: first + second
  defp _calculate(first, operand, second) when operand == ?*, do: first * second
  defp _calculate(first, operand, second) when operand == ?/, do: first / second

  def first_num(list), do: _first_num_digits(list) |> parse_number
  defp _first_num_digits([ digit | tail ]) when digit in '0123456789' do
    [ digit | _first_num_digits(tail) ]
  end
  defp _first_num_digits(list), do: []

  def last_num(list) do
    CustomEnum.reverse(list)
    |> _first_num_digits
    |> CustomEnum.reverse
    |> parse_number
  end
  
  def operator([ operand | tail ]) when operand in '+-/*', do: operand
  def operator([ _ | tail ]), do: operator(tail)

  def parse_number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def parse_number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def parse_number(str),           do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value) when digit in '01234567890' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  def center(strings) do
    max_size = Enum.map(strings, &String.length/1) |> Enum.max
    out = Enum.map(strings, fn string ->
      length = String.length(string)
      just = div(max_size - length, 2) + length
      String.rjust(string, just)
    end) |> Enum.join("\n")
    # for the heredoc tests
    "#{out}\n"
  end
end
