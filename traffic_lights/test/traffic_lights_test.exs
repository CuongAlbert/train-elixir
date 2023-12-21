defmodule TrafficLights.LightTest do
  use ExUnit.Case
  @doctest TrafficLights.Light

  test "start_link" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    assert Process.alive?(pid)
  end

  test "current light in initial" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    assert :green == TrafficLights.Light.current_light(pid)
  end

  test "transition light function" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    assert :ok == TrafficLights.Light.transition(pid)
  end

  test "transition light to yellow" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    TrafficLights.Light.transition(pid)
    assert :yellow == TrafficLights.Light.current_light(pid)
  end

  test "transition light to red" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    TrafficLights.Light.transition(pid)
    TrafficLights.Light.transition(pid)
    assert :red == TrafficLights.Light.current_light(pid)
  end

  test "transition light to green" do
    {:ok, pid} = TrafficLights.Light.start_link([])
    TrafficLights.Light.transition(pid)
    TrafficLights.Light.transition(pid)
    TrafficLights.Light.transition(pid)
    assert :green == TrafficLights.Light.current_light(pid)
  end
end
