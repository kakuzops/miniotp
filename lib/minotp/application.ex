defmodule Minotp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      criar_conta({:gustavo, 1000}),
      criar_conta({:Pedro, 1000})
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Minotp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp criar_conta({nome, saldo}),
    do: %{
      id: nome,
      start: {Core.Contas, :start_link, [{nome, saldo}]}
    }
end
