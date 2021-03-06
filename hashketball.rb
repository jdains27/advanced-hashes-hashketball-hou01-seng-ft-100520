def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def the_player_stats(player_name)
  hash= game_hash()
  hash.each do |key, team_stats|team_stats[:players].each do |k, v|
  if k[:player_name] == player_name 
    then return k
      end
    end
  end
end

def the_team_stats(team_name)
  hash = game_hash()
  hash.each do |key, team_stats| if team_stats[:team_name] == team_name 
  then return team_stats
    end
  end
end

def num_points_scored(player_name)
  the_player_stats(player_name)[:points]
end

def shoe_size(player_name)
  the_player_stats(player_name)[:shoe]
end

def team_colors(team_name)
  the_team_stats(team_name)[:colors]
end

def team_names()
  hash = game_hash()
  hash.collect do |key, team_stats|team_stats[:team_name]
  end
end

def player_numbers(team)
  the_team_stats(team)[:players].collect do |key, value| key[:number]
  end
end

def player_stats(player_name)
  the_player_stats(player_name)
end

def the_biggest_shoe()
  hash = game_hash()
  players_shoe_sizes = {}
  hash.each do |_, teams|teams[:players].each{ |players|
      players_shoe_sizes[players[:player_name]]= players[:shoe] }
  end
  shoe_sizes = players_shoe_sizes.collect{ |key, value| value }
  biggest_shoe_size = shoe_sizes.sort[-1]
  players_shoe_sizes.each{ |key, value| if value == biggest_shoe_size then 
  return key 
  end }
end

def big_shoe_rebounds()
  biggest_shoe_player = the_biggest_shoe()
  return the_player_stats(biggest_shoe_player)[:rebounds]
end