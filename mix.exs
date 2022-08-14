defmodule StillRecipes.MixProject do
  use Mix.Project

  def project do
    [
      app: :still_recipes,
      description: "A Still plugin for recipe formats",
      version: "0.1.0",
      elixir: "~> 1.11",
      source_url: "https://github.com/Cantido/still_recipes",
      package: package(),
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/Cantido/still_recipes",
        "Sponsor" => "https://liberapay.org/rosa"
      }
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:still, "~> 0.6.1"},
      {:yaml_elixir, "~> 2.4"}
    ]
  end
end
