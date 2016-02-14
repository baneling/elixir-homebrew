defmodule Grid do
  @moduledoc """
  Return a list with all 12 musical notes, starting with user's key-value.

  Examples:

    iex> Grid.get("D")

    ["D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "D#"]

  """
  
  # This probably isn't the right way to define a constant (var)
  defp sharp() do
    ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
  end
  defp flat() do
    ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
  end

  # This is blasphemous.
  @doc """
  Checks if the key is in one of the chromatic scales. 
  """
  def check(key) do
    if key in sharp do
      key
    else
      if key in flat do
        key
      else
        :error
      end
    end
  end

  @doc """
  Launches the cycle-function, with a sharp or flat chromatic scale, 
  based on the key-argument (ground note). 
  """
  def guess(key) do
    arbitrary = ["C#", "D", "F#", "G", "G#", "A", "A#", "B"]
    if key in arbitrary do
      cycle(key, sharp)
    else
      cycle(key, flat)
    end
  end

  @doc """
  If the head of the list, is exactly equal to the key, return the current list.
  Else: put head, as new tail -> repeat.
  """
  defp cycle(key, list) do
    [head|tail] = list
    if key === head do
      List.flatten([head]++[tail])
    else
      cycle(key, List.flatten([tail]++[head]))
    end
  end

  # Pathetic.
  def get(key) do
    if check(key) != :error do
      guess(key)
    else
      {:error, "Key not found!"} 
    end
  end
end
  

