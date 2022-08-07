defmodule Iconify.MixProject do
  use Mix.Project

  @project_url "https://github.com/bonfire-networks/iconify_ex"
  @version "0.0.1"

  def project do
    [
      app: :iconify_ex,
      version: @version,
      elixir: "~> 1.10",
      description: "Many collections of icons",
      organization: "Bonfire",
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
      {:phoenix_live_view, "~> 0.17"},
      {:recase, "~> 0.5"},
      {:floki, ">= 0.30.0", only: :test}
    ]
  end

  defp package() do
    [
      maintainers: ["Bonfire"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url
      }
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "deps.compile", "compile"]
    ]
  end
end
