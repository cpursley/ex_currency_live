defmodule ExCurrencyLive.Worker do
  use GenServer
  alias ExCurrencyLive.{Cache, CacheReader}
  import ExCurrencyLive.Helper, only: [rates_to_key: 2]

  ## TODO:
  ## - We probaly want a process for each exchange_rates request and a supervisor
  ## - If exchange_rates process is already running for to-from, don't try to start

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: __MODULE__])
  end

  def exchange_rates_worker(to, from) do
    GenServer.cast(__MODULE__, {:exchange_rates, rates_to_key(to, from)})
  end

  # Server API

  def init(:ok), do: {:ok, %{}}

  def handle_cast({:exchange_rates, key}, state) do
    spawn(fn -> schedule_fetch(key) end)

    {:noreply, state}
  end

  defp schedule_fetch(key) do
    Cache.delete(key)
    CacheReader.read_write_exchange_rates(key)

    5_000..15_000 |> Enum.random |> :timer.sleep()
    schedule_fetch(key)
  end
end
