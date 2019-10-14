defmodule ExCurrencyLive do
  @moduledoc ~S"""
  Stream currency exchange rates from https://www.investing.com
  """

  @doc """
  Provides a function `exchange_rates/2` for streaming currency exchange rates

  ## Examples

    iex> ExCurrencyLive.exchange_rates("usd", "rub")
    %ExCurrency.Rates{from: "usd", rate: "64.2984", to: "rub"}
    %ExCurrency.Rates{from: "usd", rate: "64.2963", to: "rub"}
    %ExCurrency.Rates{from: "usd", rate: "64.2947", to: "rub"}
    %ExCurrency.Rates{from: "usd", rate: "64.2943", to: "rub"}
    %ExCurrency.Rates{from: "usd", rate: "64.2931", to: "rub"}
  """
  defdelegate exchange_rates(to, from), to: ExCurrencyLive.Worker, as: :exchange_rates
end
