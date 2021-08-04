defmodule Conta do

  def criar({nome, saldo}), do: Core.Contas.start_link({nome, saldo})

  def extrato(nome), do: GenServer.call(nome, :dados)

  def deposito(nome, credito), do: GenServer.cast(nome, {:credito, credito})
end
