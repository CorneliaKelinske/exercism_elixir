defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @prime_factors [3, 5, 7, 1]
  @sounds %{3 => "Pling", 5 => "Plang", 7 => "Plong", 1 => ""}

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case get_sound(number) do
      "" -> to_string(number)
      sound -> sound
    end
  end

  def get_sound(number) do
    Enum.reduce(@prime_factors, "", fn(x, acc) ->
      case rem(number, 2) do
        0 -> acc <> "#{Map.fetch(@sounds, x)}"
        _ -> acc
      end
    end)
  end


end
