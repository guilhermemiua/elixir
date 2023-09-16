defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Guilherme", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Guilherme", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %Player{
          life: 100, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Guilherme"
        },
        computer: %Player{
          life: 100, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Computer"
        },
        turn: :player
      }

      assert expected_response = Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Guilherme", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)

      Game.start(computer, player)

      start_state = %{
        status: :started,
        player: %Player{
          life: 100, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Guilherme"
        },
        computer: %Player{
          life: 100, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Computer"
        },
        turn: :player
      }

      assert start_state = Game.info()

      new_state = %{
        status: :started,
        player: %Player{
          life: 90, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Guilherme"
        },
        computer: %Player{
          life: 30, moves: %{move_heal: :cura, move_avg: :chute, move_rnd: :soco}, name: "Computer"
        },
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
