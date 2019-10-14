defmodule ExCurrencyLive.Cache do
  use GenServer

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: __MODULE__])
  end

  def read(key) do
    GenServer.call(__MODULE__, {:read, key})
  end

  def write(key, val) do
    GenServer.cast(__MODULE__, {:write, key, val})
  end

  def delete(key) do
    GenServer.cast(__MODULE__, {:delete, key})
  end

  def clear do
    GenServer.cast(__MODULE__, {:clear})
  end

  # Server API

  def init(:ok), do: {:ok, %{}}

  def handle_call({:read, key}, _from, cache) do
    {:reply, Map.fetch(cache, key), cache}
  end

  def handle_cast({:write, key, val}, cache) do
    {:noreply, Map.put(cache, key, val)}
  end

  def handle_cast({:delete, key}, cache) do
    {:noreply, Map.delete(cache, key)}
  end

  def handle_cast({:clear}, _cache) do
    {:noreply, %{}}
  end
end
