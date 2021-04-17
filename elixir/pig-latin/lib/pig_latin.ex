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
    |> get_beginning
    |> determine_rule
    |> apply_rule

  end

  defp get_beginning(phrase) do
    {String.at(phrase, 0), phrase}
  end

  defp determine_rule({letter, phrase}) when letter in ["a", "e", "i", "o", "u"] do
    {:rule1, phrase}
  end

  defp apply_rule({rule1, phrase}) do
    phrase<>"ay"
  end

end
