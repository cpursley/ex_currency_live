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

Stream an exchange rate
```
iex> ExCurrencyLive.exchange_rates("usd", "rub")
{:usd_rub, "64.3130"}
{:usd_rub, "64.3138"}
{:usd_rub, "64.3138"}
{:usd_rub, "64.3135"}
{:usd_rub, "64.3131"}
{:usd_rub, "64.3127"
```