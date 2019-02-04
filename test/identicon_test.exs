defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "tests the main function calls the hasher" do
    assert Identicon.main("banana") == Identicon.hash_input("banana")
  end
end
