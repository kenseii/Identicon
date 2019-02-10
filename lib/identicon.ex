defmodule Identicon do

  # This function receives an `input string` to be hashed from the user,
  # After that it pipes it in the `hash_input` method to change it to MD5.
  # the hashed list is piped in the `pick_color`
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
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

  @doc """
  This method creates a grid from the given struct of hex and color.
  It changes the hex list to sets of 3 elements using `Enum.chunk_every(3)`.

  After that it calls a `mirror_function` that duplicate the first 2 elements of the chunk to the right.
  `[1,2,3]` becomes `[1,2,3,2,1].
  Enum.map function here calls the `mirror_rows` and pass it every row like a for loop.
  Lastly it changes the output of mirror_rows from a `list of lists` to a `single list of elements`.


  """
  def build_grid(%Identicon.Image{hex: hex} = image_struct) do
    hex
    |> Enum.chunk(3)
      # This also can work, but not that much functional
      # Enum.chunk_every(image_struct.hex,3)
    |> Enum.map(&mirror_rows/1)
      # makes it a single list of elements
    |> List.flatten
      # add indexes to the flattened list
    |> Enum.with_index



  end

  @doc """
  Duplicate the first 2 columns and put them in the end of the list.
  `[1, 2, 3]` becomes `[1, 2, 3, 2, 1]`.
  Note: It can do the same by using the Enum module, `.take` to take the first 2 elements,
  and `.reverse` to reverse the first 2 elements then finally append it at the end using ++.

  """
  def mirror_rows(row) do
    # patter matching to get the 1st and 2nd
    [first, second | _tail] = row
    # add it to the end
    row ++ [second, first]

  end

end
