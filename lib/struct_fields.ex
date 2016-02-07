defmodule StructFields do
  @moduledoc """
  Defines a `fields` function that returns all fields of a struct.

  Fields can be ignored by using the `ignore` option; the `:__struct__` field is
  always ignored.

  ## Examples

      iex> defmodule MyModule do
      ...>   use StructFields
      ...>
      ...>   defstruct [:foo, :bar]
      ...> end
      ...>
      ...> MyModule.fields
      [:bar, :foo]

      iex> defmodule AnotherModule do
      ...>  use StructFields, ignore: [:not_me]
      ...>
      ...>  defstruct [:this, :not_me, :that]
      ...> end
      ...>
      ...> AnotherModule.fields
      [:that, :this]
  """

  @doc false
  defmacro __using__(opts) do
    fields_to_ignore = [:__struct__ | Dict.get(opts, :ignore, [])]
    quote bind_quoted: [fields_to_ignore: fields_to_ignore] do
      Module.put_attribute __MODULE__, :fields_to_ignore, fields_to_ignore

      @before_compile StructFields
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      @fields Map.keys(%__MODULE__{}) -- @fields_to_ignore

      def fields, do: @fields
    end
  end
end
