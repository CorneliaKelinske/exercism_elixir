defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """
  use GenServer
  defstruct [
    balance: 0,
    status: :open
  ]


  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account


  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer


  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any

end
