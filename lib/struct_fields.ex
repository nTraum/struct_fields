defmodule StructFields do
  @moduledoc """
  Defines a `fields` macro that returns all fields of a struct.

  ## Examples

      defmodule MyModule do
        defstruct [:foo, :bar]

        # Use the module
        use StructFields
      end

      MyModule.fields
      #=> [:foo, :bar]
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      @before_compile StructFields
    end
  end
  defmacro __before_compile__(_env) do
    quote do
      def fields do
        Map.keys(%__MODULE__{}) |> List.delete(:__struct__)
      end
    end
  end
end
