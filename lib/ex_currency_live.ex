defmodule ExCurrencyLive do
  @moduledoc ~S"""
  Stream currency exchange rates from https://www.investing.com
  """

  @doc """
  Provides a function `exchange_rates_worker/2` for starting exchange rates worker

  ## Examples

    iex> ExCurrencyLive.exchange_rates_worker("usd", "rub")
    :ok
  """
  defdelegate exchange_rates_worker(to, from), to: ExCurrencyLive.Worker, as: :exchange_rates_worker

  @doc """
  Provides a function `exchange_rates/2` for fetching cached exchange rates

  ## Examples

    iex> ExCurrencyLive.exchange_rates_fetcher("usd", "rub")
    %ExCurrency.Rates{from: "usd", rate: "64.3130", to: "rub"}
  """
  defdelegate exchange_rates_fetcher(to, from), to: ExCurrencyLive.CacheReader, as: :exchange_rates_fetcher

end
