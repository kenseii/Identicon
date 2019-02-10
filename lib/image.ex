# This module holds the code of the image struct

defmodule Identicon.Image do
  # Define a struct to hold the hashed data, and rgb color if there, and hold the grid data once generated
  defstruct hex: nil, color: nil, grid: nil

end