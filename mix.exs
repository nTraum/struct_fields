defmodule StructFields.Mixfile do
  use Mix.Project

  def project do
    [app: :struct_fields,
     version: "0.1.0",
     description: description,
     elixir: "~> 1.2",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: []]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev}]
  end

  def description do
    "Tiny module to easily get a list of fields for structs."
  end

  def package do
    [maintainers: ["Philipp Preß"],
     links: %{"GitHub" => "https://github.com/nTraum/struct_fields"},
     licenses: ["MIT"]]
  end
end
