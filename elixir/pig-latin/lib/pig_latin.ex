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
    cond do
      Regex.match?(~r/^[aeiou][\w]+/, phrase) == true -> take_path1(phrase)
      Regex.match?(~r/^[^aeiou][qu][\w]+/, phrase) == true -> take_path2(phrase)
      Regex.match?(~r/^[qu][\w]+/, phrase) == true -> take_path2(phrase)
      Regex.match?(~r/^[^aeiou][\w]+/, phrase) == true -> take_path3(phrase)
    end
  end

  defp take_path1(phrase) do
    phrase<>"ay"
  end

  defp take_path2(phrase) do
    IO.puts("path2")
    chunks = Regex.named_captures(~r/(?<chunk_1>^[^aeiou]*[qu]+)(?<chunk_2>[\w]+)/, phrase)
    "#{Map.get(chunks, "chunk_2")}#{Map.get(chunks, "chunk_1")}"<>"ay"
  end

  defp take_path3(phrase) do
    chunks = Regex.named_captures(~r/(?<chunk_1>^[^aeiou]+)(?<chunk_2>[\w]+)/, phrase)
    "#{Map.get(chunks, "chunk_2")}#{Map.get(chunks, "chunk_1")}"<>"ay"
  end


end
