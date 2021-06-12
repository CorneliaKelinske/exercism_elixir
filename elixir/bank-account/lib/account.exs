defmodule Account do
  use GenServer

  #Client
  def open_bank do
    with {:ok, pid} <- GenServer.start_link(__MODULE__, %{balance: 0, status: :open}) do
      pid
    else
      error -> raise "Account was not opened. #{inspect(error)}"
    end
  end

  def update(pid, amount) do
    GenServer.cast(pid, {:deposit, amount})
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  def close_bank(pid) do
    GenServer.cast(pid, :account_closed)
  end

  #Server
  def init(account) do
    {:ok, account}
  end

  def handle_cast(:account_closed, account) do
    updated_account = Map.put(account, :status, :account_closed)
    {:noreply, updated_account}
  end

  def handle_cast({amount}, account) when is_integer(amount) do
    updated_account = Map.put(account, :balance, account.balance + amount)
    {:noreply, updated_account}
  end

  def handle_call(_, from, account = %{status: :account_closed}) do
    {:reply, {:error, :account_closed}, account}  end


  def handle_call(:view, from, account) do
    {:reply, account, account}
  end



end
