defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/^[A-Z]|[A-Z](?:[a-z])/, string)
    |> IO.inspect()
    |> Enum.map(fn(x) -> List.to_string(x) end)
    |> Enum.map(fn(x) -> String.first(x) end)
    |> IO.inspect()
    |> Enum.join
    |> String.upcase

  end


end

#Regex.scan(~r/^[A-Z]|[A-Z](?:[a-z])/,"Portable Networks Graphic")

# string
#     |> String.replace(["-", "_"], " ")
#     |> String.split()
#     |> Enum.reduce("", & &2 <> String.first(&1))
#     |> String.upcase()
