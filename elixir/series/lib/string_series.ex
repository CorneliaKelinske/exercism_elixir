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
    cond do
      String.length(string) == n ->
        [string]
      String.length(string) < n ->
        []
    end
    process_string(string, n)

  end

  def process_string("", n), do: []
  def process_string(string, n) do
    #And here I want to return a list, wherein the head is the first slice of the string and
    #the tail is where I call process_string on the slice from index 1 to the end of the string
    #But it won't work because I will run out of string
  end

end
