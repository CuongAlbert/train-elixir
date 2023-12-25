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
    children = [
      {Finch, name: MyFinch}
    ]
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

  def all() do
    children = [
      {Finch, name: MyFinch}
    ]
    Finch.start_link(name: MyFinch)
    all_response = Finch.build(:get, "https://pokeapi.co/api/v2/pokemon") |> Finch.request!(MyFinch)
    pokemon_data = Jason.decode!(all_response.body)
    total = pokemon_data["count"]
    # pokemon_data["results"] |> Enum.map(fn pokemon -> get(pokemon["name"]) end)
    1..total |> Enum.map(fn id -> get(id) end)
  end
end
