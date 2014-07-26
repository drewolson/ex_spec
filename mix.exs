defmodule ExSpec.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_spec,
     version: "0.1.0",
     elixir: "~> 0.14.3",
     package: package,
     description: "BDD-like syntax for ExUnit",
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    []
  end

  defp package do
    [
      contributors: ["Drew Olson"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/drewolson/ex_spec"}
    ]
  end
end
