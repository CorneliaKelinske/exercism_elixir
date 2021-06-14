defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """
  use GenServer

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  # Client

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank do
    case GenServer.start_link(__MODULE__, %{balance: 0, status: :open}) do
      {:ok, pid} -> pid
      error -> raise "Account was not opened. #{inspect(error)}"
    end
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.cast(account, :close_account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    GenServer.call(account, :balance)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    GenServer.call(account, {:deposit, amount})
  end

  # Server
  def init(account) do
    {:ok, account}
  end

  def handle_cast(:close_account, account) do
    updated_account = Map.put(account, :status, :account_closed)
    {:noreply, updated_account}
  end

  def handle_call(_, _from, account = %{status: :account_closed}) do
    {:reply, {:error, :account_closed}, account}
  end

  def handle_call({:deposit, amount}, _from, account) when is_integer(amount) do
    updated_account = Map.put(account, :balance, account.balance + amount)
    {:reply, {:ok}, updated_account}
  end

  def handle_call(:balance, _from, account) do
    {:reply, account.balance, account}
  end
end
