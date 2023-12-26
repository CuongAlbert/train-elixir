defmodule Pokemon do
  defstruct [
    :id,
    :name,
    :hp,
    :attack,
    :defense,
    :special_attack,
    :special_defense,
    :speed,
    :weight,
    :height,
    :types
  ]
end
defmodule Pokelixir do
  @moduledoc """
  Documentation for `Pokelixir`.
  """

def get(name) do

    Finch.start_link(name: MyFinch)
    response = Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/#{name}") |> Finch.request!(MyFinch)
    pokemon_data = Jason.decode!(response.body)
    stats = Map.new(pokemon_data["stats"], fn stat -> {stat["stat"]["name"], stat["base_stat"]} end)
    %Pokemon{
      id: pokemon_data["id"],
      name: pokemon_data["name"],
      hp: stats["hp"],
      attack: stats["attack"],
      defense: stats["defense"],
      special_attack: stats["special-attack"],
      special_defense: stats["special-defense"],
      speed: stats["speed"],
      weight: pokemon_data["weight"],
      height: pokemon_data["height"],
      types: Enum.map(pokemon_data["types"], fn type -> type["type"]["name"] end)
    }
  end

  def all(url \\ "https://pokeapi.co/api/v2/pokemon") do
    Finch.start_link(name: MyFinch)
    all_response = Finch.build(:get, url) |> Finch.request!(MyFinch)
    pokemon_data = Jason.decode!(all_response.body)
    next = pokemon_data["next"]
    IO.puts(next)
    list = pokemon_data["results"]
    |> Enum.map(fn pokemon -> Task.async(fn -> get(pokemon["name"]) end) end)
    |> Task.await_many()
    case next do
      nil -> list
      _ -> [list | all(next)]
    end
    # 1..100
    # |> Enum.map(fn id -> Task.async(fn -> get(id) end) end) |> Task.await_many()
  end
end
