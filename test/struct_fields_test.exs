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
    defmodule TestGreeter do
      use StructFields

      defstruct greeting: :hello
      def greet(%TestGreeter{greeting: g}), do: g
    end

    assert length(TestGreeter.fields) == 1
    assert Enum.member?(TestGreeter.fields, :greeting)
  end
end
