defmodule CounterWeb.RandomNumberController do
  use CounterWeb, :controller

  def random(conn, _params) do
    render(conn, :randomNumber, random_number: Enum.random(1..100))
  end
end
