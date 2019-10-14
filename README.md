# ExCurrencyLive

An Elixir library for streaming currency exchange rates from [www.investing.com](https://www.investing.com)

## Installation

```elixir
def deps do
  [
    {:ex_currency_live, git: "https://github.com/cpursley/ex_currency_live.git"}
  ]
end
```

## Usage

Stream an exchange rate
```
iex(1)> ExCurrency.exchange_rates("usd", "rub")
{:ok, %ExCurrency.Rates{from: "usd", rate: "64.2224", to: "rub"}}
```

Fetch multiple exchange rates (concurrently)
```
iex> ExCurrencyLive.exchange_rates("usd", "rub")
%ExCurrency.Rates{from: "usd", rate: "64.2984", to: "rub"}
%ExCurrency.Rates{from: "usd", rate: "64.2963", to: "rub"}
%ExCurrency.Rates{from: "usd", rate: "64.2947", to: "rub"}
%ExCurrency.Rates{from: "usd", rate: "64.2943", to: "rub"}
%ExCurrency.Rates{from: "usd", rate: "64.2931", to: "rub"}
```