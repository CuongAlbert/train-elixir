defmodule Games.Wordle do
  @moduledoc """

  """
  @spec play() :: [atom()]
  def play do
    target = "toast"
    guess = IO.gets("Enter a five letter word: ") |> String.trim() |> String.replace("\n","")
    format_feedback(feedback(target, guess))
  end
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

defp format_feedback(feedback) do
  formatted_feedback =
    feedback
    |> Enum.map(&feedback_color/1)
    |> Enum.join(", ")

  IO.puts(formatted_feedback)
end

defp feedback_color(:green), do: IO.ANSI.green() <> "green"
defp feedback_color(:yellow), do: IO.ANSI.yellow() <> "yellow"
defp feedback_color(:grey), do: IO.ANSI.light_black() <> "grey"
end
