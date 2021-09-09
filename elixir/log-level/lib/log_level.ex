defmodule LogLevel do
  @levels %{
    0 => %{false => :trace, true => :unknown},
    1 => %{false => :debug, true => :debug},
    2 => %{false => :info, true => :info},
    3 => %{false => :warning, true => :warning},
    4 => %{false => :error, true => :error},
    5 => %{false => :fatal, true => :unknown},
  }

  @recipients %{:error => :ops, :fatal => :ops}

  def to_label(level, legacy?) when level in 0..5 do
      @levels[level][legacy?]
  end
  def to_label(_level, _legacy?), do: :unknown

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
  end
end
