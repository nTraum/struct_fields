# StructFields

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

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add struct_fields to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:struct_fields, "~> 0.1.0"}]
end
```

2. Ensure struct_fields is started before your application:

```elixir
def application do
  [applications: [:struct_fields]]
end
```
