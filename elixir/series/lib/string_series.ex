defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(string, 1), do: String.codepoints(string)

  def slices(string, n) when n <= 0, do: []

  def slices(string, n) do
    case String.length(string) do
      ^n ->
        [string]

      length when length < n ->
        []

      length ->
        count = length - n + 1
        process_string(string, n, count)
    end
  end

  def process_string(_string, n, 0), do: []

  def process_string(string, n, count) do
    new_string = String.slice(string, 1, String.length(string) - 1)
    [
      String.slice(string, 0, n)
      | process_string(new_string, n, count - 1)
    ]
  end
end
