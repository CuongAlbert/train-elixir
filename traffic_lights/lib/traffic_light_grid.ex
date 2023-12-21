defmodule TrafficLights.Grid do
  @moduledoc """
  Documentation for `TrafficLightGrid`.
  """
  # Server API
  use GenServer

  @impl true
  def init(_opt) do
    {:ok, [:green, :red, :red, :red, :red]}
  end

  @impl true
  def handle_cast(:transition, lights) do
    {:noreply, Enum.map(lights, fn light -> change(light) end)}
  end

  @impl true
  def handle_call(:current, _from, lights) do
    {:reply, lights, lights}
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

  def current_lights(pid) do
    GenServer.call(pid, :current)
  end

end
