# Write your code below game_hash

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

def get_players(team_name)
  hash = game_hash
  hash.each do |region, team|
    if team[:team_name] == team_name
      return team[:players]
    end
  end
end

def get_all_players
  hash = game_hash
  hash[:home][:players].concat(hash[:away][:players])
end

def num_points_scored(name)
  players = get_all_players
  players.each do |player|
    return player[:points] if player[:player_name] == name
  end
end

def shoe_size(name)
  players = get_all_players
  players.each { |player| return player[:shoe] if player[:player_name] == name }
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |region, team|
    return team[:colors] if team[:team_name] == team_name
  end
end

def team_names
  arr = []
  hash = game_hash
  hash.each { |region, team| arr << team[:team_name] }
  arr
end

def player_numbers(team_name)
  numbers = []
  players = get_players(team_name)
  players.each { |player| numbers << player[:number] }
  numbers
end

def player_stats(name)
  players = get_all_players
  players.each do |player|
    if player[:player_name] == name
      return player
    end
  end
end

def big_shoe_rebounds
  players = get_all_players
  max_size = 0
  max_idx = 0
  players.each_with_index do |player, i|
    if player[:shoe] > max_size
      max_size = player[:shoe]
      max_idx = i
    end
  end
  return players[max_idx][:rebounds]
end

def most_points_scored
  players = get_all_players
  max = 0
  max_idx = 0
  players.each_with_index do |player, i|
    if player[:points] > max
      max = player[:points]
      max_idx = i
    end
  end
  return players[max_idx][:player_name]
end

def total_points_scored(team)
  players = get_players(team)
  total = 0
  players.each { |player| total += player[:points] }
  return total
end

def winning_team
  total_points_scored("Brooklyn Nets") > total_points_scored("Charlotte Hornets") ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  players = get_all_players
  longest_name = ""
  players.each do |player|
    if player[:player_name].length > longest_name.length
      longest_name = player[:player_name]
    end
  end
  return longest_name
end

def player_with_most_steals
  players = get_all_players
  max_steals = 0
  max_idx = 0
  players.each_with_index do |player, i|
    if player[:steals] > max_steals
      max_steals = player[:steals]
      max_idx = i
    end
  end
  return players[max_idx][:player_name]
end

def long_name_steals_a_ton?
  return player_with_longest_name == player_with_most_steals
end