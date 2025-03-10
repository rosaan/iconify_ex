defmodule Iconify.MixProject do
  use Mix.Project

  @project_url "https://github.com/bonfire-networks/iconify_ex"
  @version "0.3.0"

  def project do
    [
      app: :iconify_ex,
      version: @version,
      elixir: "~> 1.10",
      description: "Phoenix Component generator for the SVG of 100,000+ icons from 100+ icon sets from https://iconify.design",
      source_url: @project_url,
      homepage_url: @project_url,
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: [main: "readme", extras: ["README.md"]],
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.3"},
      {:phoenix_live_view, "~> 0.19 or ~> 0.20"},
      {:surface, git: "https://github.com/rosaan/surface", optional: true},
      {:phoenix_live_favicon, "~> 0.2.0", optional: true},
      {:recase, "~> 0.5"},
      {:arrows, "~> 0.1"},
      {:floki, ">= 0.30.0", only: :test}
    ]
  end

  defp package() do
    [
      maintainers: ["Bonfire"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url,
        "Browse available icons" => "https://icon-sets.iconify.design"
      },
      files: ["lib", "mix.exs", "README*", "assets/package.json"]
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "deps.compile", "compile"]
    ]
  end
end
