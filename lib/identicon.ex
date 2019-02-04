defmodule Identicon do

  # This function receives an `input string` to be hashed from the user,
  # After that it pipes it in the hash_input method to change it to MD5
  def main(input) do
    input
    |> hash_input

  end


  @doc """
    This function hashes the given input using MD5 Algorithm.
    it takes the given input -> hashed binary.
    Changes the hashed binary to a list of numbers.

      iex> Identicon.hash_input("banana")
      [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]

  """
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end
end
