defmodule TrafficLights.Light do
  @moduledoc """
  Documentation for `TrafficLights`.
  """
  # Server API
  use GenServer

  @impl true
  def init(_opt) do
    {:ok, :green}
  end

  @impl true
  def handle_cast(:transition, light) do
    {:noreply, change(light)}
  end

  @impl true
  def handle_call(:current, _from, light) do
    {:reply, light, light}
  end

  defp change(light) do
    case light do
      :green -> :yellow
      :yellow -> :red
      :red -> :green
    end
  end

  # Client API
  def start_link(_otp) do
    GenServer.start_link(__MODULE__, [])
  end
  def transition(pid) do
    GenServer.cast(pid, :transition)
  end

  def current_light(pid) do
    GenServer.call(pid, :current)
  end

end
