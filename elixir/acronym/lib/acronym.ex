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
    if is_inconsistent_case?(string) do
      do_inconsistent_case(string)
    else
      do_normal(string)
    end
  end

  defp is_inconsistent_case?(string) do
    Regex.match?(~r/[a-z][A-Z][a-z]/, string)
  end

  defp do_inconsistent_case(string) do
    Regex.scan(~r/[A-Z]|[A-Z](?:[a-z])/, string)
    |> Enum.map(& List.to_string(&1))
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
