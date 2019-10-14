defmodule ExCurrencyLive.CacheReader do
  alias ExCurrencyLive.Cache

  ## TODO:
  ## - Add timestamp (monotomic) to ex_currency struct

  def currency_read_write(key) do
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
        Cache.write(key, {key, value.rate})
        {:ok, rate} = Cache.read(key)
        IO.inspect(rate)
        rate
      _ ->
        currency_read_write(key)
    end
  end

  defp key_to_string(key), do: key |> to_string |> String.split("_")
end
