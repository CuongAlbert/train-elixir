defmodule TrafficLights.GridTest do
  use ExUnit.Case
  # @doctest TrafficLights.Grid


  test "transition" do
    {:ok, pid} = TrafficLights.Grid.start_link([])

    :ok = TrafficLights.Grid.transition(pid)
    assert [:yellow, :green, :green, :green, :green] == TrafficLights.Grid.current_lights(pid)

    :ok = TrafficLights.Grid.transition(pid)
    assert [:red, :yellow, :yellow, :yellow, :yellow] == TrafficLights.Grid.current_lights(pid)

    :ok = TrafficLights.Grid.transition(pid)
    assert [:green, :red, :red, :red, :red] == TrafficLights.Grid.current_lights(pid)
  end

end
