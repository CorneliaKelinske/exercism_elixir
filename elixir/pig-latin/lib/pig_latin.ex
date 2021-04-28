defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """


  @spec translate(phrase :: String.t()) :: String.t()

  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&apply_translation/1)
    |> Enum.join(" ")
  end


  defp apply_translation(word) do
    cond do
      Regex.match?(~r/^[aeiou][\w]+/, word)-> vowel_rule(word)
      Regex.match?(~r/^[xy][^aeiou][\w]+/, word)-> vowel_rule(word)
      Regex.match?(~r/^[^aeiou]*qu[\w]+/, word) -> qu_rule(word)
      Regex.match?(~r/^[^aeiou][\w]+/, word) -> consonant_rule(word)
    end
  end

  defp vowel_rule(word) do
    word <> "ay"
  end

  defp qu_rule(word) do
    IO.puts("path2")
    chunks = Regex.named_captures(~r/(?<chunk_1>^[^aeiou]*qu)(?<chunk_2>[\w]+)/, word)
    "#{chunks["chunk_2"]}#{chunks["chunk_1"]}ay"
  end

  defp consonant_rule(word) do
    chunks = Regex.named_captures(~r/(?<chunk_1>^[^aeiou]+)(?<chunk_2>[\w]+)/, word)
    "#{chunks["chunk_2"]}#{chunks["chunk_1"]}ay"
  end


end
