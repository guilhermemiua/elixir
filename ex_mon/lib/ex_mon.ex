defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_game "Robotinik"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_game
    |> create_player(:punch, :kich, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    Actions.fetch_move(move)
  end
end
