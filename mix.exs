defmodule Crystal.MixProject do
  use Mix.Project

  def project do
    [
      app: :crystal,
      version: ("VERSION" |> File.read! |> String.trim),
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # excoveralls
      test_coverage:      [tool: ExCoveralls],
      preferred_cli_env:  [
        coveralls:              :test,
        "coveralls.travis":     :test,
        "coveralls.circle":     :test,
        "coveralls.semaphore":  :test,
        "coveralls.post":       :test,
        "coveralls.detail":     :test,
        "coveralls.html":       :test,
      ],
      # dialyxir
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore",
        plt_add_apps: [
          :mix,
          :ex_unit,
        ]
      ],
      # ex_doc
      name:         "Crystal",
      source_url:   "https://github.com/coingaming/crystal",
      homepage_url: "https://github.com/coingaming/crystal",
      docs:         [main: "readme", extras: ["README.md"]],
      # hex.pm stuff
      description:  "Static type system for BEAM. Crystal is Elixir wrapper around Gradualizer.",
      package: [
        licenses: ["Apache 2.0"],
        files: ["lib", "priv", "mix.exs", "README*", "VERSION*"],
        maintainers: ["Ilja Tkachuk aka timCF"],
        links: %{
          "GitHub" => "https://github.com/coingaming/crystal",
          "Author's home page" => "https://timcf.github.io",
        }
      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Crystal.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "bench/support"]
  defp elixirc_paths(:dev),  do: ["lib", "bench/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:gradualizer, github: "josefs/Gradualizer"},
      {:uelli, github: "coingaming/uelli"},
      # development tools
      {:excoveralls, "~> 0.9", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5",    only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.18",     only: [:dev, :test], runtime: false},
      {:credo, "~> 0.8",       only: [:dev, :test], runtime: false},
      {:boilex, "~> 0.2",      only: [:dev, :test], runtime: false},
    ]
  end
end
