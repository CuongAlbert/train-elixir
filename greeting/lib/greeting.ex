defmodule Greeting do
  @moduledoc """
  Documentation for `Greeting`.
  """

  @spec main(any()) :: :ok
  @doc """
  Hello world.

  ## Examples

      iex> Greeting.main()
      "Good morning"/n

  """
  def main(args) do
    {opts, _word, _errors} = OptionParser.parse(args, switches: [upcase: :boolean])
    greet = if opts[:upcase] do String.upcase("Good morning") else "Good morning" end
    IO.puts greet
  end
end
