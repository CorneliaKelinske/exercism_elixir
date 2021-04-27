defmodule PigLatinCopy do
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
    |> determine_path
    |> go_path

  end

  defp get_beginning(phrase) do
    {String.at(phrase, 0), phrase}
  end

  defp determine_path({letter, phrase}) when letter in ["a", "e", "i", "o", "u"] do
    {:path1, phrase}
  end

 
  defp determine_path({_letter, phrase}) do
    {:path2, phrase}
  end

  defp go_path({:path1, phrase}) do
    phrase<>"ay"
  end

  defp go_path({:path2, phrase}) do
    chunks = Regex.named_captures(~r/(?<chunk_1>^[^aeiou]+)(?<chunk_2>[\w]+)/, phrase)
    "#{Map.get(chunks, "chunk_2")}#{Map.get(chunks, "chunk_1")}"<>"ay"

  end

end
