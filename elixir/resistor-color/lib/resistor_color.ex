defmodule ResistorColor do
  @moduledoc false
  @color_codes %{
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }


  @spec colors() :: list(String.t())
  def colors do
    colors = [
      "black",
      "brown",
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "violet",
      "grey",
      "white"
    ]
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    @color_codes[color]
  end
end
