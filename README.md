# StructFields

[![Build Status](https://travis-ci.org/nTraum/struct_fields.svg?branch=master)](https://travis-ci.org/nTraum/struct_fields)
[![Hex.pm](https://img.shields.io/hexpm/v/struct_fields.svg)](https://hex.pm/packages/struct_fields)

Tiny module to easily get a list of fields for structs.

## Example

```elixir
defmodule MyModule do
  defstruct [:foo, :bar]

  # Use the module
  use StructFields
end

MyModule.fields
#=> [:foo, :bar]
```

## Installation

1. Add `struct_fields` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:struct_fields, "~> 0.2.0"}]
end
```

2. Ensure `struct_fields` is started before your application:

```elixir
def application do
  [applications: [:struct_fields]]
end
```

## Documentation

http://hexdocs.pm/struct_fields
