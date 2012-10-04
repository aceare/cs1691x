=begin
  In a game of rock-paper-scissors, each player chooses to play
  Rock (R), Paper (P), or Scissors (S). The rules are:
    R beats S; S beats P; and P beats R.
    # R > S, S > P, P > R
  We will encode a rock-paper-scissors game as a list, where the elements are themselves
  2-element lists that encode a player's name and a player's strategy, as shown below:

    [ ["Armando", "P"], ["Dave", "S"] ] # Dave would win since S > P
=end

=begin
  (a) Single instance of rock-paper-scissors game
  Write a method rps_game_winner that takes a two-element list and behaves as follows:

  - If the number of players is not equal to 2, raise WrongNumberOfPlayersError.
  - If either player's strategy is something other than "R", "P" or "S" (case-insensitive),
    raise NoSuchStrategyError.
  - Otherwise, return the name and strategy of the winning player.
    If both players use the same strategy, the first player is the winner. 
=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
 
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless "PRSprs".include? game[0][1]
  raise NoSuchStrategyError unless "PRSprs".include? game[1][1]
  
  # R > S, S > P, P > R
#  rules = { "SR" => 1, "PS" => 1, "RP" => 1 }     # player# 1 is winner.
#  return game [ rules[(game[0][1] + game[1][1]).upcase] ]
#  rules = { [["S"], ["R"]] => 1, [["P"], ["S"]] => 1, [["R"], ["P"]] => 1 }     # player 1 is winner.
  rules = { ["S", "R"] => 1, ["P", "S"] => 1, ["R", "P"] => 1 }     # player 1 is winner.
  rules.default = 0   # for all combinations other than the ones in hash, including same strategy, player# 0 is winner.
  return game [ rules[ [ game[0][1].upcase, game[1][1].upcase ] ] ]
end


=begin
  (b) Rock-paper-scissors tournament
  A rock-paper-scissors tournament is encoded as a bracketed array of games. See below:

  [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
  ]

  Given the above tournament, Dave would beat Armando (S>P), Richard would beat Michael (R>S),
  and then Dave and Richard would play (Richard wins since R>S). Similarly, Allen would beat Omer,
  Richard X would beat David E., and Allen and Richard X. would play (Allen wins since S>P).
  Finally, Richard would beat Allen since R>S. Note that the tournament continues until there
  is only a single winner.

  Write a method rps_tournament_winner that takes a tournament encoded as a bracketed array and
  returns the winner (for the above example, it should return ["Richard", "R"]).

  Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to
  a single winner. You can assume that the initial tournament is well-formed (that is, there
  are 2^n players, and each one participates in exactly one match per round). 
=end

def rps_tournament_winner(tournament)
  raise WrongNumberOfPlayersError unless tournament.length == 2
      # recursion exit condition tournament = [ ["Armando", "P"], ["Dave", "S"] ]
  return rps_game_winner(tournament) if tournament.first.first.class == String
  p0 = rps_tournament_winner(tournament[0])
  p1 = rps_tournament_winner(tournament[1])
  rps_game_winner([p0, p1])
end

#p rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
#p rps_game_winner([ ["Armando", "r"], ["Dave", "s"] ])
#p rps_game_winner([ ["Armando", "P"] ])
#p rps_game_winner([ ["Armando", "P"], ["Dave", "Q"] ])

tournament1 =
[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]


#p rps_tournament_winner(tournament1)
#p tournament1.inspect
#p tournament1.class
