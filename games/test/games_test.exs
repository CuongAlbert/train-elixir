ExUnit.start(auto_run: false)
defmodule GamesTest do
  use ExUnit.Case
  doctest Games.Wordle

  test "feedback" do
    assert Games.Wordle.feedback("aaaaa","aaaaa") == [:green, :green, :green, :green, :green]
    assert Games.Wordle.feedback("abcde","edaba") == [:yellow, :yellow, :yellow, :yellow, :yellow]
    assert Games.Wordle.feedback("aaaaa","aaaab") == [:green, :green, :green, :green, :grey]
    assert Games.Wordle.feedback("aaaaa","bbbbb") == [:grey, :grey, :grey, :grey, :grey]
    assert Games.Wordle.feedback("abcde","acbxt") == [:green, :yellow, :yellow, :grey, :grey]
  end
end

ExUnit.run()
