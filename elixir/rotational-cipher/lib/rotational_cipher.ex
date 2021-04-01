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


  defp shift(charlist, shift) do
    Enum.map(charlist, fn char -> encode(char, shift) end)
  end

  defp encode(char, shift) when char >= 97 and char <= 122 do
    case rem(char-96+shift, 26) + 96 do
      96 -> 'z'
      new_char -> new_char
    end
  end


  # defp is_lower?(char) do
  #   char >= 97 && char <= 122
  # end

  # defp is_upper?(char) do
  #   char >= 65 && char <= 90
  # end






end
