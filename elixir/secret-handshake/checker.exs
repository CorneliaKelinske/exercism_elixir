defmodule Checker do
  use Bitwise

  def compare(num1, num2) do
    num1 &&& num2 > 0 -> @actions[num2]
    num1 &&& num2 = 0 -> []
  end
end
