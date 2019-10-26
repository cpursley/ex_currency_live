# ExCurrencyLive

An Elixir library for streaming currency exchange rates from [www.investing.com](https://www.investing.com)

Uses [ex_currency](https://github.com/cpursley/ex_currency) for fetching currency.

## Installation

```elixir
def deps do
  [
    {:ex_currency_live, git: "https://github.com/cpursley/ex_currency_live.git"}
  ]
end
```

## Usage

Start exchange rates worker
```
iex> ExCurrencyLive.exchange_rates_worker("usd", "rub")
:ok
```

Fetch cached exchange rates
```
iex> ExCurrencyLive.exchange_rates_fetcher("usd", "rub")
%ExCurrency.Rates{from: "usd", rate: "64.3130", to: "rub"}
```
