defmodule ExCurrencyLive.CacheReader do
  alias ExCurrencyLive.Cache
  import ExCurrencyLive.Helper, only: [rates_to_key: 2, key_to_string: 1]

  ## TODO:
  ## - add old value
  ## - Add timestamp (monotomic) to ex_currency struct

  def exchange_rates_fetcher(to, from) do
    rates_to_key(to, from)
    |> read_write_exchange_rates
  end

  def read_exchange_rates(key) do
    case Cache.read(key) do
      {:ok, rate} ->
        rate
      :error ->
        {:error, :not_cached}
    end
  end

  def read_write_exchange_rates(key) do
    case Cache.read(key) do
      {:ok, rate} ->
        rate
      :error ->
        fetch_exchange_rates(key)
    end
  end

  defp fetch_exchange_rates(key) do
    [to, from] = key_to_string(key)
    case ExCurrency.exchange_rates(to, from) do
      {:ok, value} ->
        Cache.write(key, value)
        {:ok, rate} = Cache.read(key)
        rate
      _ ->
        read_write_exchange_rates(key)
    end
  end
end
