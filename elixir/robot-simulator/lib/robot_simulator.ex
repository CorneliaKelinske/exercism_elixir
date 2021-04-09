defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  defstruct [
    direction: :north,
    position: {0, 0},
  ]

  @valid_directions [:north, :south, :west, :east]

  @turns %{
    {:north, "R"} => :east, {:north, "L"} => :west,
    {:east, "R"} => :south, {:east, "L"} => :north,
    {:south, "R"} => :west, {:south, "L"} => :east,
    {:west, "R"} => :north, {:west, "L"} => :south
  }


  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction \\ nil, position \\ nil)
  def create(nil, nil) do
    %RobotSimulator{}
  end

    def create(direction, {a, b} = position) when direction in @valid_directions and is_integer(a) and is_integer(b) do
    %RobotSimulator{direction: direction, position: position}
  end

  def create(_invalid_direction, {a, b} = position) when is_integer(a) and is_integer(b) do
    {:error, "invalid direction"}
  end

  def create(direction, _invalid_position) when direction in @valid_directions do
    {:error, "invalid position"}
  end





  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    String.graphemes(instructions)
    |> Enum.reduce(robot, &do_action/2)
  end

  defp do_action(instruction, robot) when instruction == "L" or instruction == "R" do
    %RobotSimulator{robot | direction: @turns[{robot.direction, instruction}]}
    |> IO.inspect
    # IO.inspect(instruction)
    # IO.inspect(robot)
  end

  defp do_action(instruction, robot) when instruction == "A" do
    robot
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%RobotSimulator{direction: direction}) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%RobotSimulator{position: position}) do
    position
  end
end