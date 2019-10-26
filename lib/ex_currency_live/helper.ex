defmodule ExCurrencyLive.Helper do
  def rates_to_key(to, from), do: to <> "_" <> from |> String.to_atom

  def key_to_string(key), do: key |> to_string |> String.split("_")
end
