defmodule Bob do
  def hey(input) do
    trimmed = String.trim(input)

    cond do
      empty_string?(input) -> "Fine. Be that way!"
      yelling?(trimmed) && question?(trimmed) -> "Calm down, I know what I'm doing!"
      question?(trimmed) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty_string?(input), do: String.trim(input) === ""

  defp yelling?(input), do: String.downcase(input) != input and String.upcase(input) == input

  defp question?(input), do: String.ends_with?(input, "?")
end
