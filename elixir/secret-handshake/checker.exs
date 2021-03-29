defmodule Checker do

  def determine_action(num1, num2) do
    num1, num2, when compare(num1, num2) > 0 -> "Buggers"
    num1, num2 when compare(num1, num2) == 0 -> []
  end


  def compare(num1, num2) do
    use Bitwise
    num1 &&& num2
  end
end
