defmodule Account do
  use GenServer

  #Client
  #I assume that this is what will later be called open_bank()
  def start_link do
    GenServer.start_link(__MODULE__, %{balance: 0, status: :open})
  end

  #this likely corresponds to the update function
  def add(pid, amount) do
    GenServer.cast(pid, amount)
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  #Server
  def init(account) do
    {:ok, account}
  end

  def handle_cast(amount, account) do
    updated_account = Map.put(account, :balance, account.balance + amount)
    {:noreply, updated_account}
  end

  def handle_call(:view, from, account) do
    {:reply, account, account}
  end

end
