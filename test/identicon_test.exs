defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "tests the main function gets the final output" do
    assert Identicon.main("banana") == %Identicon.Image{
             color: {114, 179, 2},
             grid: [
               {114, 0},
               {2, 2},
               {114, 4},
               {122, 7},
               {34, 10},
               {138, 11},
               {138, 13},
               {34, 14},
               {124, 22}
             ],
             hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65],
             pixel_map: [
               {{0, 0}, {50, 50}},
               {{100, 0}, {150, 50}},
               {{200, 0}, {250, 50}},
               {{100, 50}, {150, 100}},
               {{0, 100}, {50, 150}},
               {{50, 100}, {100, 150}},
               {{150, 100}, {200, 150}},
               {{200, 100}, {250, 150}},
               {{100, 200}, {150, 250}}
             ]
           }

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
           ) == %Identicon.Image{
             color: {114, 179, 2},
             grid: [
               {114, 0},
               {179, 1},
               {2, 2},
               {179, 3},
               {114, 4},
               {191, 5},
               {41, 6},
               {122, 7},
               {41, 8},
               {191, 9},
               {34, 10},
               {138, 11},
               {117, 12},
               {138, 13},
               {34, 14},
               {115, 15},
               {1, 16},
               {35, 17},
               {1, 18},
               {115, 19},
               {239, 20},
               {239, 21},
               {124, 22},
               {239, 23},
               {239, 24}
             ],
             hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
           }

  end

end
