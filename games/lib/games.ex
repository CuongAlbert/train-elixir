defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """
  @spec main(any()) :: :ok | [atom()]
  def main(_args) do
    loop()
  end

  defp loop do
    IO.puts("What game would you like to play?")
    IO.puts("1. Guessing Game")
    IO.puts("2. Rock Paper Scissors")
    IO.puts("3. Wordle")
    IO.puts("Enter 'stop' to exit")

    case IO.gets("") |> String.trim() do
      "1" -> Games.GuessingGame.play()
      "2" -> Games.RockPaperScissors.play()
      "3" -> Games.Wordle.play()
      "stop" -> IO.puts("Exiting the program."); System.halt(0)
    end
  end
end
