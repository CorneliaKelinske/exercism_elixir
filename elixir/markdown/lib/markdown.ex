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
  defp process(t) do
    IO.inspect(t, label: "this is t")
    case String.first(t) do
      "#" -> enclose_with_header_tag(parse_header_md_level(t))
      "*" -> parse_list_md_level(t)
      _ -> enclose_with_paragraph_tag(String.split(t))
    end
  end

  #decided to change the 'hwt' argument to 't' since it is still the original string that is being passed into this function
  defp parse_header_md_level(t) do
    [h | t] = String.split(t)
    {to_string(String.length(h)), Enum.join(t, " ")}
    |> IO.inspect(label: "output of parse_heder_md_level")
    # {"number", "text minus the header markup"}
  end

  defp parse_list_md_level(l) do
    IO.inspect(l, label: "Input to parse_list_md_level")
    t = String.split(String.trim_leading(l, "* "))
    "<li>" <> join_words_with_tags(t) <> "</li>"
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
