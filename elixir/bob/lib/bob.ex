defmodule Bob do
  def hey(input) do
    cond do

      String.trim(input) === "" -> "Fine. Be that way!"
      String.match?(String.trim(input), ~r/[[:alpha:]]/u) == false && String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/[[:alpha:]]/u) == false -> "Whatever."
      String.ends_with?(input, "?") && String.upcase(input) == input -> "Calm down, I know what I'm doing!"
      String.upcase(input) == input -> "Whoa, chill out!"
      String.ends_with?(String.trim(input), "?") -> "Sure."
      String.length(input) > 0 -> "Whatever."
      true -> "Did you say something?"

    end
  end
end
