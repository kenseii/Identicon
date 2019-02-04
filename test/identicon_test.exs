defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "tests the main function calls the hasher" do
    assert Identicon.main("banana") == Identicon.pick_color(
             %Identicon.Image{
               hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
             }
           )
  end
end
