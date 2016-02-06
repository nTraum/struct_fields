defmodule StructFieldsTest do
  use ExUnit.Case

  test "fields" do
    defmodule MyModule do
      defstruct [:foo, :bar]

      use StructFields
    end

    assert length(MyModule.fields) == 2
    assert Enum.member?(MyModule.fields, :foo)
    assert Enum.member?(MyModule.fields, :bar)
  end

  test "use declared anywhere at top level" do
    defmodule MyModule do
      use StructFields

      defstruct greeting: :hello
      def greet(%MyModule{greeting: g}), do: g
    end

    assert length(MyModule.fields) == 1
    assert Enum.member?(MyModule.fields, :greeting)
  end
end
