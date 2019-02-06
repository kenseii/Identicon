defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "tests the main function gets the final output" do
    assert Identicon.main("banana") == Identicon.build_grid(
             %Identicon.Image{
               color: {114, 179, 2},
               hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
             }
           )
  end

  test "test if the pick_color returns the struct with hex list and color tuple" do
    assert Identicon.pick_color(
             %Identicon.Image{hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]}
           ) == %Identicon.Image{
             color: {114, 179, 2},
             hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
           }

  end

  test "test if the grid generates the 5x5 lists" do
    assert Identicon.build_grid(
             %Identicon.Image{
               color: {114, 179, 2},
               hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
             }
           ) == [
             [114, 179, 2, 179, 114],
             [191, 41, 122, 41, 191],
             [34, 138, 117, 138, 34],
             [115, 1, 35, 1, 115],
             [239, 239, 124, 239, 239]
           ]

  end

end
