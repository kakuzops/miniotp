defmodule Core.Contas do
  use GenServer

  def init(conta), do: {:ok, conta}

  def start_link({nome, saldo}) do
    GenServer.start_link(__MODULE__, {nome, saldo}, name: nome)
  end

  def handle_call(:dados, _form, state) do
    {:reply, state, state}
  end

  def handle_cast({:credito, credito}, state) do
    Process.sleep(3_000)
    {nome, saldo_atual} = state
    {:noreply, {nome, saldo_atual + credito}}
  end
end
