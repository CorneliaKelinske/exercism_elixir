defmodule Bob do
  def hey(input) do
    cond do
      String.length(input) > 0 -> "Whatever."
    end
  end
end
