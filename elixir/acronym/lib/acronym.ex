defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    do_abbreviate(string)
  end

  defp do_abbreviate(string) do
    if is_exception?(string) do
      do_exception(string)
    else
      do_normal(string)
    end
  end

  defp is_exception?(string) do
    Regex.match?(~r/[a-z][A-Z][a-z]/, string)
  end

  defp do_exception(string) do
    Regex.scan(~r/^[A-Z]|[A-Z](?:[a-z])/, string)
    |> Enum.map(fn(x) -> List.to_string(x) end)
    |> Enum.map(fn(x) -> List.to_string(x) end)
    |> Enum.map(fn(x) -> String.first(x) end)
    |> Enum.join
    |> String.upcase
  end

  defp do_normal(string) do
    string
    |> String.replace(["-", "_"], " ")
    |> String.split()
    |> Enum.reduce("", & &2 <> String.first(&1))
    |> String.upcase()
  end


end

#[A-Z]|[A-Z](?:[a-z])



# string
#     |> String.replace(["-", "_"], " ")
#     |> String.split()
#     |> Enum.reduce("", & &2 <> String.first(&1))
#     |> String.upcase()

# Regex.scan(~r/^[A-Z]|[A-Z](?:[a-z])/, string)
#     |> IO.inspect()
#     |> Enum.map(fn(x) -> List.to_string(x) end)
#     |> Enum.map(fn(x) -> String.first(x) end)
#     |> IO.inspect()
#     |> Enum.join
#     |> String.upcase
