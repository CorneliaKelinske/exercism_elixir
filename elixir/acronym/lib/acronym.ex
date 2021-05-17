defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    if inconsistent_case?(string) do
      abb_inconsistent_case(string)
    else
      abb_normal_case(string)
    end
  end


  defp inconsistent_case?(string) do
    Regex.match?(~r/[a-z][A-Z][a-z]/, string)
  end

  defp abb_inconsistent_case(string) do
    Regex.scan(~r/[A-Z]|[A-Z](?:[a-z])/, string)
    |> Enum.map(& List.to_string(&1))
    |> Enum.join
    |> String.upcase
  end

  defp abb_normal_case(string) do
    string
    |> String.replace(["-", "_"], " ")
    |> String.split()
    |> Enum.reduce("", & &2 <> String.first(&1))
    |> String.upcase()
  end

end
