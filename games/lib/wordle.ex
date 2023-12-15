defmodule Games.Wordle do
  @moduledoc """

  """
  @spec play() :: list()
  def play do
    target = "toast"
    guess = IO.gets("Enter a five letter word:") |> String.trim()
    feedback(target, guess)
  end
  @doc """
  iex> Games.Wordle.feedback("aaaaa", "aaaaa")
  [:green, :green, :green, :green, :green]

  iex> Games.Wordle.feedback("aaaaa", "aaaab")
  [:green, :green, :green, :green, :grey]

  iex> Games.Wordle.feedback("abdce", "edcba")
  [:yellow, :yellow, :yellow, :yellow, :yellow]

  # If There Are Duplicate Characters In The Guess Prioritize Exact Matches.
  iex> Games.Wordle.feedback("aaabb", "xaaaa")
  [:grey, :green, :green, :yellow, :grey]
  """
  @spec feedback(String.t(), String.t()) :: list(atom())
  def feedback(target, guess) do
    string1 = String.codepoints(target)
    string2 = String.codepoints(guess)
    Enum.zip(string1, string2)
    |> Enum.reduce([], fn {s, g}, acc ->
        idx = length(acc) - 1
        List.insert_at(acc, length(acc),
        cond do
          s == g -> :green
          idx > 0 && g == String.at(guess, idx) && Enum.at(acc, idx) != :green -> :grey
          g in string1 -> :yellow
          true -> :grey
          # s == g -> IO.puts(IO.ANSI.green() <> "green")
          # g in String.codepoints(secret_word) -> IO.puts(IO.ANSI.yellow() <> "yellow")
          # true -> IO.puts(IO.ANSI.light_black() <> "grey")
        end)
      end)
  end

#   defp format_feedback(feedback) do
#     feedback
#     |> Enum.join(", ")
#     |> IO.ANSI.format()
#   end
end
