defmodule StackTest do
  use ExUnit.Case
  # @doctest

  test "start_link/1 - default state" do
    assert {:ok, pid} = Stack.start_link([])
    assert Process.alive?(pid)
  end

  # test "start_link/1 - default configure" do
  #   assert {:ok, pid} = Stack.start_link([])
  #   assert Process.alive?(pid)
  # end

  # test"push/1 - add element to empty stack" do
  #   {:ok, pid} = Stack.start_link([])
  #   assert :ok == Stack.push(pid, "first item")
  # end

  # test"push/1 - add element to stack with multi elements" do
  #   {:ok, pid} = Stack.start_link([])
  #   Stack.push(pid, "first item")
  #   assert :ok == Stack.push(pid, "second item")
  # end

  # test"pop/1 - remove one element from stack" do
  #   {:ok, pid} = Stack.start_link([])
  #   Stack.push(pid, "first item")
  #   assert "first item" == Stack.pop(pid)
  # end

  # test"pop/1 - remove multi elements from stack" do
  #   {:ok, pid} = Stack.start_link([])
  #   Stack.push(pid, "first item")
  #   Stack.push(pid, "second item")
  #   assert "first item"== Stack.pop(pid)
  #   assert "second item"== Stack.pop(pid)
  # end

  # test"pop/1 - remove element from empty stack" do
  #   {:ok, pid} = Stack.start_link([])
  #   assert nil == Stack.pop(pid)
  # end

end
