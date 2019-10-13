defmodule ExCurrencyLive.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_currency_live,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExCurrencyLive.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_currency, git: "https://github.com/cpursley/ex_currency.git"}
    ]
  end
end
