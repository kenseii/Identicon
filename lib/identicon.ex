defmodule Identicon do

  # This function receives an `input string` to be hashed from the user,
  # After that it pipes it in the hash_input method to change it to MD5
  def main(input) do
    input
    |> hash_input
    |> pick_color

  end


  @doc """
    This function hashes the given input using MD5 Algorithm.
    it takes the given input -> hashed binary.
    Changes the hashed binary to a list of numbers.
    Pass that number to the Image struct.

      iex> Identicon.hash_input("banana")
      %Identicon.Image{
      hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
      }

  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    # Send to the struct
    %Identicon.Image{hex: hex}
  end


  @doc"""
  This function receives the struct and extract the RGB values.
  Those RGB values are the first 3 elements stored in the struct.
  It uses pattern matching and put the input's first 3 elements and set the rest as tail.

  After that, it updates the struct to hold a `RGB tuple` and another list containing the hex numbers.


  """
  def pick_color(image_struct) do
    # set the struct to have rgb and tail sections
    %Identicon.Image{hex: [r, g, b | _tail]} = image_struct
    # join the normal struct with the color tuple(tuple to keep the order of data)
    %Identicon.Image{image_struct | color: {r, g, b}}

  end



end
