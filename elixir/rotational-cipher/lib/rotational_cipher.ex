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
  end

  defp shift(charlist, shift) do
    Enum.map(charlist, fn char -> encode(char, shift) end)
  end

  defp encode(char, shift) when char >= 97 and char <= 122 do
    case rem(char(-96 + shift, 26)) + 96 do
      96 -> 'z'
      new_char -> new_char
    end
  end

  defp encode(char, shift) when char >= 65 and char <= 90 do
    case rem(char - 64 + shift, 26) + 64 do
      90 -> 'z'
      new_char -> new_char
    end
  end

  defp encode(char, shift), do: char
end
