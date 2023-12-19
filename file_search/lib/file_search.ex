defmodule FileSearch do
  @moduledoc """
  Documentation for `FileSearch`.
  """

  @spec main(any()) :: any()
  @doc """
  Hello world.

  ## Examples

      iex> FileSearch.hello()
      :world

  """
  def main(_args) do
    by_extension("_build")
  end
  def all(folder) do
    File.ls!(folder)
    |> Enum.map(fn f ->
      path = Path.join(folder, f)
      if File.dir?(path) do
        all(path)
      else f
      end
    end)
    |> List.flatten()
  end

  def by_extension(folder) do
    all(folder) |> Enum.reduce(%{}, fn file, acc ->
      ext = Path.extname(file)
      Map.update(acc, ext, [file], fn files -> [file | files] end)
    end)
  end
end
