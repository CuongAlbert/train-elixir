defmodule FileSearch do
  @moduledoc """
  Documentation for `FileSearch`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FileSearch.hello()
      :world

  """
  def main(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [type: :boolean])
    case opts[:type] do
      true -> by_extension(".")
      _ -> all(".")
    end |> IO.inspect()
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
