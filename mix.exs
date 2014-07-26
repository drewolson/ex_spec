defmodule ExSpec.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_spec,
     version: "0.1.0",
     elixir: "~> 0.14.3",
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    []
  end
end
