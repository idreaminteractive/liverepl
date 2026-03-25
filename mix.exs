defmodule Liverepl.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/idreaminteractive/liverepl"

  def project do
    [
      app: :liverepl,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "A Phoenix LiveView component for iex`.",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 1.1"},
      {:phoenix_html, "~> 4.0"},
      {:extty, "~> 0.4"},

      # Dev/test only
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Your Name"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      # Include assets so consumers can reference them via file: dep
      files: ~w(lib assets mix.exs README.md LICENSE package.json)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end
end
