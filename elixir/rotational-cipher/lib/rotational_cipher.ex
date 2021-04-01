defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """


  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> shift(shift)
    |> List.to_string()
    |> IO.inspect
  end

  # defp shift(charlist, shift) when shift == 26 or shift == 0 do
  #   charlist
  # end

  defp shift(charlist, shift) do
    Enum.map(charlist, fn x ->
      case rem(x-96+shift, 26) + 96 do
        96 -> 'z'
        char -> char
      end
    end)
  end

  
end

# Enum.reduce(@decimals, [], fn x, acc ->
#   case determine_action(x, num) do
#     nil -> acc
#     value -> [value | acc]
#   end
