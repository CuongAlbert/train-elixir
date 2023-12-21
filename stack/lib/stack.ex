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
    {ele, new} = List.pop_at(state, -1, nil)
    {:reply, ele, new}
  end

  # Client API
  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(_otp) do
    GenServer.start_link(__MODULE__, [])
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
