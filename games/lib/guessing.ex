defmodule Games.GuessingGame do
  @moduledoc """

  """
  @spec play() :: :ok
  def play do
    target = Enum.random(1..10)
    guess_loop(target, true, 5)
  end

  defp guess_loop(target, is_first_loop, remaining) do
    if remaining == 0 do
      IO.puts("You lose! The answer was #{target}")
    else
      message = if is_first_loop, do: "Guess a number between 1 and 10:", else: "Enter your guess:"
      IO.puts(message)

      guess = IO.gets("") |> String.trim() |> String.to_integer()

      case guess do
        ^target ->
          IO.puts("Correct!")

        _ ->
          feedback = if guess < target, do: "Too Low!", else: "Too High!"
          IO.puts(feedback)
          guess_loop(target, false, remaining - 1)
      end
    end
  end
end
