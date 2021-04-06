defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  defstruct [
    direction: :north,
    position: {0, 0},
  ]

  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction \\ nil, position \\ nil)
   def create(nil, nil) do
    %RobotSimulator{}
  end

  def create(direction, position) do
    %RobotSimulator{direction: direction, position: position}
    |> IO.inspect

  end




  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
