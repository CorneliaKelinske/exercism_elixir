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
  def parse(m) do
    m
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
    |> IO.inspect(label: "output of parse_heder_md_level")
    # {"number", "text minus the header markup"}
  end

  #changed the argument to "line" for the same reason as in the parse_header_md_function above. also changed "t" to "text"
  defp parse_list_md_level(line) do
    IO.inspect(line, label: "Input to parse_list_md_level")
    text = String.split(String.trim_leading(line, "* "))
    IO.inspect(text, label: "This is text")
    "<li>" <> join_words_with_tags(text) <> "</li>"
    |> IO.inspect(label: "parse_list_md_level output")
  end

  defp enclose_with_header_tag({hl, htl}) do
    "<h" <> hl <> ">" <> htl <> "</h" <> hl <> ">"
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp join_words_with_tags(t) do
    Enum.join(Enum.map(t, fn w -> replace_md_with_tag(w) end), " ")
  end

  defp replace_md_with_tag(w) do
    replace_suffix_md(replace_prefix_md(w))
  end

  defp replace_prefix_md(w) do
    cond do
      w =~ ~r/^#{"__"}{1}/ -> String.replace(w, ~r/^#{"__"}{1}/, "<strong>", global: false)
      w =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(w, ~r/_/, "<em>", global: false)
      true -> w
    end
  end

  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end

  defp patch(l) do
    String.replace_suffix(
      String.replace(l, "<li>", "<ul>" <> "<li>", global: false),
      "</li>",
      "</li>" <> "</ul>"
    )
  end
end
