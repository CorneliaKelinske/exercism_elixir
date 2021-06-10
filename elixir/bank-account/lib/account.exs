defmodule Account do
  use GenServer

  #Client
  def start_link do
    GenServer.start_link(__MODULE__, %{balance: 0, status: :open})
  end

  #Server
  def init(account) do
    {:ok, account}
  end

end
