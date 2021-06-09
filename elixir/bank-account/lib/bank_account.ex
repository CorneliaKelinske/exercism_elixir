defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """
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
  def open_bank() do
    account = %BankAccount{}
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    Map.put(account, :status, :account_closed)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    account.balance
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    Map.put(account, :balance, account.balance + amount)
  end
end
