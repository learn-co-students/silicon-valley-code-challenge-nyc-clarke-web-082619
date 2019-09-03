require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Dream Cloud", "AJ Fickory", "Cloud")
startup2 = Startup.new("Go Caaa", "hellboy", "Game")
startup3 = Startup.new("whatever", "hellboy", "APP")

vc1 = VentureCapitalist.new("Equiventure", 2000000000.0)
vc2 = VentureCapitalist.new("Crazyventure", 50000000000.0)
vc3 = VentureCapitalist.new("No Money at all", 100.0)

fd1 = FundingRound.new(startup1, vc1, "angel", 50000.0)
fd2 = FundingRound.new(startup2, vc1, "angel", 100.0)
fd3 = FundingRound.new(startup3, vc2, "Pre-Seed", 1000000000.0)
fd4 = FundingRound.new(startup1, vc2, "Round 1", 500000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line