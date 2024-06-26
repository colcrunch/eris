defmodule Eris.MixProject do
  use Mix.Project

  def project do
    [
      app: :eris,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Eris, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenvy, "~> 0.8.0"},
      {:nostrum, "~> 0.9"},
      {:nosedrum, git: "https://github.com/jchristgit/nosedrum"},
      {:ecto_sql, "~> 3.11.2"},
      {:myxql, "~> 0.6.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
