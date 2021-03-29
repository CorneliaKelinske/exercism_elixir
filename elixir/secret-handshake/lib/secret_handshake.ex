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

  end

  def decode (num) do
    Enum.reduce(@decimals, [], fn x, acc -> [determine_action(x, num) | acc] end)
  end

  def compare(num1, num2) do
    use Bitwise
    num1 &&& num2
  end

  def determine_action(num1, num2) do

    compare(num1, num2) > 0 -> @actions[num2]
    compare(num1, num2) == 0 -> []
  end
end
