defmodule Games.RockPaperScissors do
  @moduledoc """

  """
  def play do
    ai_choice = Enum.random(["rock", "paper", "scissors"])
    IO.puts("AI choice: #{ai_choice}")
    IO.puts("Choose rock, paper, or scissors:")
    user_choice = IO.gets("") |> String.trim()

    outcome = case {user_choice, ai_choice} do
      {"rock", "scissors"} -> "You win! Rock beats scissors."
      {"paper", "rock"} -> "You win! Paper beats rock."
      {"scissors", "paper"} -> "You win! Scissors beats paper."
      {choice, choice} -> "It's a tie!"
      {_, _} -> "You lose! #{ai_choice} beats #{user_choice}."
    end

    IO.puts(outcome)
  end
end
