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
end
