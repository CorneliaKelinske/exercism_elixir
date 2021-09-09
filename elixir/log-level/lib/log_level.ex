defmodule LogLevel do
  @levels %{
    0 => %{false => :trace, true => :unknown},
    1 => %{false => :debug, true => :debug},
    2 => %{false => :info, true => :info},
    3 => %{false => :warning, true => :warning},
    4 => %{false => :error, true => :error},
    5 => %{false => :fatal, true => :unknown}
  }

  def to_label(level, legacy?) when level in 0..5 do
    @levels[level][legacy?]
  end

  def to_label(_level, _legacy?), do: :unknown

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    determine_recipient(label, legacy?)
  end

  def determine_recipient(label, _legacy) when label in [:error, :fatal], do: :ops
  def determine_recipient(:unknown, true), do: :dev1
  def determine_recipient(:unknown, false), do: :dev2
  def determine_recipient(_label, _legacy?), do: false
end
