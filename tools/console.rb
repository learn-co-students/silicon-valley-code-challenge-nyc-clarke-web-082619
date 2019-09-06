require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("SU1", "founder1", "domain1")
startup2 = Startup.new("SU2", "founder2", "domain2")
startup3 = Startup.new("SU3", "founder3", "domain3")
startup4 = Startup.new("SU4", "founder4", "domain4")
startup5 = Startup.new("SU5", "founder5", "domain5")

venture_capitalist1 = VentureCapitalist.new("VC1", 50000000)
venture_capitalist2 = VentureCapitalist.new("VC2", 2000000000)
venture_capitalist3 = VentureCapitalist.new("VC3", 9000000)
venture_capitalist4 = VentureCapitalist.new("VC4", 5000000000)

fundingRound1 = FundingRound.new(startup1, venture_capitalist4, "Angel", 1000000.0)
fundingRound2 = FundingRound.new(startup2, venture_capitalist3, "Pre-Seed", 5000000.0)
fundingRound3 = FundingRound.new(startup3, venture_capitalist2, "Seed", 10000000.0)
fundingRound4 = FundingRound.new(startup4, venture_capitalist1, "Series A", 50000000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line