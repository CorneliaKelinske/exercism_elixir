defmodule SecretHandshake do
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
    |> order_actions(code)
  end

  def decode(num) do
    @decimals
    |> Enum.reduce([], fn x, acc -> [determine_action(x, num) | acc] end)
    |> List.flatten()
  end

  def order_actions(actions, num) do
    cond do
      compare(16, num) > 0 -> actions
      true -> Enum.reverse(actions)
    end
  end

  def determine_action(num1, num2) do
    cond do
      compare(num1, num2) > 0 -> @actions[num1]
      true -> []
    end
  end

  def compare(num1, num2) do
    use Bitwise
    num1 &&& num2
  end
end
