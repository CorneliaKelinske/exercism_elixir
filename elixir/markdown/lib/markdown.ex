defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """

  #Refactored into a pipeline to get rid of the nested functions
  @spec parse(String.t()) :: String.t()
  def parse(markdown_text) do
    markdown_text
    |> String.split("\n")
    |> Enum.map(& process(&1))
    |> Enum.join()
    |> patch()

  end

  #I removed the nested if structure and replaced it with 'case'"
  # changed 't' into 'line' because it is the result of String.split in the parse function
  defp process(line) do
    case String.first(line) do
      "#" -> enclose_with_header_tag(parse_header_md_level(line))
      "*" -> parse_list_md_level(line)
      _ -> enclose_with_paragraph_tag(String.split(line))
    end
  end

  #decided to change the 'hwt' argument to 'line' since it is still the line from the process function that gets passed in here
  defp parse_header_md_level(line) do
    [h | t] = String.split(line)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  #changed the argument to "line" for the same reason as in the parse_header_md_function above. also changed "t" to "text"
  defp parse_list_md_level(line) do
    text = String.split(String.trim_leading(line, "* "))
    "<li>" <> join_words_with_tags(text) <> "</li>"
  end

  defp enclose_with_header_tag({hl, htl}) do
    "<h" <> hl <> ">" <> htl <> "</h" <> hl <> ">"
  end

  #I changed the argument to split_line to reflect that it is the result of String.split(line) in the process(line) function
  defp enclose_with_paragraph_tag(split_line) do
    "<p>#{join_words_with_tags(split_line)}</p>"
  end

  #I changed the argument to unsplit_text
  defp join_words_with_tags(unsplit_text) do
    Enum.join(Enum.map(unsplit_text, fn word -> replace_md_with_tag(word) end), " ")

  end

  #I changed the argument name from "w" to "word" everywhere
  defp replace_md_with_tag(word) do
    replace_suffix_md(replace_prefix_md(word))
  end

  defp replace_prefix_md(word) do
    cond do
      word =~ ~r/^#{"__"}{1}/ -> String.replace(word, ~r/^#{"__"}{1}/, "<strong>", global: false)
      word =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(word, ~r/_/, "<em>", global: false)
      true -> word
    end
  end

  defp replace_suffix_md(word) do
    cond do
      word =~ ~r/#{"__"}{1}$/ -> String.replace(word, ~r/#{"__"}{1}$/, "</strong>")
      word =~ ~r/[^#{"_"}{1}]/ -> String.replace(word, ~r/_/, "</em>")
      true -> word
    end
  end

  #Once again changed "l" to "line" for more clarity
  defp patch(line) do
    String.replace_suffix(
      String.replace(line, "<li>", "<ul>" <> "<li>", global: false),
      "</li>",
      "</li>" <> "</ul>"
    )
  end
end
