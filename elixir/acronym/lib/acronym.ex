defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split("-")
    |> split_up_hyphenated()
    |> Enum.reduce("", & &2 <> String.first(&1))
    |> String.upcase()
  end

  defp split_up_hyphenated(string) do
    Enum.map(string, fn x ->
      case String.contains?(x, "-") do
        true -> String.split(x, "-")
        false -> x
      end
    end)

  end
end
