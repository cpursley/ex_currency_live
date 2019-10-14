defmodule ExCurrencyLive.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {ExCurrencyLive.Worker, []},
      {ExCurrencyLive.Cache, []},
    ]

    opts = [strategy: :one_for_one, name: ExCurrencyLive.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
