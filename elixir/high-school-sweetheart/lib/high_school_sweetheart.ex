defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim_leading()
    |> String.first()
 end


  def initial(name) do
    initial = String.upcase(first_letter(name))
    "#{initial}" <> "."
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> Enum.map_join(" ", &initial/1)
  end

  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *

    # Please implement the pair/2 function
  end
end
