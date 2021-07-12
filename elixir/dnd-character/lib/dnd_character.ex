defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    floor((score - 10) / 2)
  end

  @spec ability :: pos_integer()
  def ability do
    roll_four_times
    |> Enum.sort()
    |> List.delete_at(3)
    |> Enum.sum()
  end

  def roll_four_times do
    for x <- 1..4 do
      roll_dice()
    end
  end

  def roll_dice() do
    Enum.random(1..6)
  end

  @spec character :: t()
  def character do
  end
end
