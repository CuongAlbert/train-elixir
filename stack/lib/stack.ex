defmodule Stack do
  @moduledoc """
  Documentation for `Stack`.
    iex> {:ok, pid} = Stack.start_link([])
    iex> :ok = Stack.push(pid, 1)
    iex> Stack.pop(pid)
    1
    iex> Stack.pop(pid)
    nil
  """
  # Server API
  use GenServer

  @impl true
  @spec init(any()) :: {:ok, []}
  def init(_init) do
    {:ok, []}
  end

  @impl true
  def handle_cast({:push, ele}, state) do
    {:noreply, state ++ [ele]}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end

  # Client API
  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(_otp) do
    children = [
      {Stack, []}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
    # GenServer.start_link(__MODULE__, [])
  end

  @spec push(atom() | pid() | {atom(), any()} | {:via, atom(), any()}, any()) :: :ok
  def push(pid, ele) do
    GenServer.cast(pid, {:push, ele})
  end

  @spec pop(atom() | pid() | {atom(), any()} | {:via, atom(), any()}) :: any()
  def pop(pid) do
    GenServer.call(pid, :pop)
  end
end
