defmodule Checker do

  def determine_action(num1, num2) do
    cond do
      compare(num1, num2) > 0 -> compare(num1, num2)
      compare(num1, num2) == 0 -> []
    end
  end


  def compare(num1, num2) do
    use Bitwise
    num1 &&& num2
  end
end
