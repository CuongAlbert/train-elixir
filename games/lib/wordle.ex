defmodule Games.Wordle do
  def play do
    secret_word = "toast"
    guess = IO.gets("Enter a five letter word:") |> String.trim()
    feedback(secret_word, guess)
  end

  def feedback(secret_word, guess) do
    Enum.zip(String.codepoints(secret_word), String.codepoints(guess))
    |> Enum.map(fn {s, g} ->
      cond do
        s == g -> :green
        g in String.codepoints(secret_word) -> :yellow
        true -> :grey
        # s == g -> IO.puts(IO.ANSI.green() <> "green")
        # g in String.codepoints(secret_word) -> IO.puts(IO.ANSI.yellow() <> "yellow")
        # true -> IO.puts(IO.ANSI.light_black() <> "grey")
      end
    end)
  end

#   defp format_feedback(feedback) do
#     feedback
#     |> Enum.join(", ")
#     |> IO.ANSI.format()
#   end
end