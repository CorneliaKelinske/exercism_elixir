defmodule Zipper do
  @type t :: any()

  defstruct [:value, :left, :right, :up_left, :up_right]

  alias BinTree, as: BT

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  @spec from_tree(nil) :: nil
  def from_tree(nil), do: nil

  def from_tree(%BT{value: value, left: left, right: right}) do
    %Zipper{
      value: value,
      left: from_tree(left),
      right: from_tree(right),
      up_left: nil,
      up_right: nil
    }
  end

  @doc """
  Get the complete tree from a zipper.
  """

  def to_tree(nil), do: nil
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%Zipper{value: value, left: left, right: right, up_left: nil, up_right: nil}) do
    %BT{value: value, left: to_tree(left), right: to_tree(right)}
  end

  def to_tree(
        %Zipper{value: value, left: left, right: right, up_left: up_left, up_right: up_right} = zipper
      ) when is_nil(up_left) or is_nil(up_right) do
    zipper
    |> up()
    |> to_tree()
  end



  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(%Zipper{value: value}) do
    value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(%Zipper{left: left}) do
    left
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(%Zipper{right: right}) do
    right
  end

  @doc """
  Get the parent of the focus node, if any.
  """

  @spec up(Zipper.t() | nil) :: Zipper.t() | nil
  def up(%Zipper{up_left: nil, up_right: nil}), do: nil

  def up(zipper) do
    raise "NOT IMPLEMENTED"
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper, value) do
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper, left) do
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper, right) do
  end
end
