defmodule SecretHandshakeAlan do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  10000 = Reverse the order of the operations in the secret handshake
  """

  @decimals [1, 2, 4, 8]
  @actions %{1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump"}

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> decode()
    |> maybe_reverse(code)
  end

  defp decode(num) do
    Enum.reduce(@decimals, [], fn x, acc ->
      case determine_action(x, num) do
        nil -> acc
        value -> [value | acc]
      end
    end)
  end

  defp maybe_reverse(actions, num) do
    cond do
      compare(16, num) > 0 -> actions
      true -> Enum.reverse(actions)
    end
  end

  defp determine_action(num1, num2) do
    if compare(num1, num2) > 0, do: @actions[num1]
  end

  defp compare(num1, num2) do
    num1 &&& num2
  end
end
