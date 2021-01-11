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

# Write code here

def num_points_scored(name)
  scored = 0 
  game_hash.each do |team, stats|
    player_stats = stats[:players]
    player_stats.each do |detail_stats|
      if detail_stats[:player_name] == name 
        scored = detail_stats[:points]
      end
    end
  end
  scored 
end
    
def shoe_size(name)
  size = 0 
  game_hash.each do |team, team_stats|
    player_stats = team_stats[:players]
    player_stats.each do |detail_stats|
      if detail_stats[:player_name] == name 
        size = detail_stats[:shoe]
      end
    end
  end
  size 
end

def team_colors(team_name)
  colors = nil 
  game_hash.each do |team, team_details|
    if team_details[:team_name] == team_name 
      colors = team_details[:colors]
    end
  end
  colors
end

def team_names
  game_hash.collect do |team, team_details|
    team_details[:team_name]
  end
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, team_details|
    if team_details[:team_name] == team_name
      team_details[:players].each do |player|
        player.each do |key, value|
          if key == :number 
            jersey_numbers << value 
          end 
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  player_stats = {}
  game_hash.each do |team, team_details|
    team_details[:players].each do |stats|
      if stats[:player_name] == name
        player_stats = stats 
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  shoe_size = 0 
  rebounds = 0 
  game_hash.each do |team, team_details|
    team_details[:players].each do |stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
  
