require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Warby Parker", "Brian Magida", "glasses")
s2 = Startup.new("Lola", "Jeffrey Magida", "plugs")
s3 = Startup.new("Peloton", "Daniel Magida", "bikes")

vc1 = VentureCapitalist.new("Mo Money Mo Problems", 999999)
vc2 = VentureCapitalist.new("Make it Rain", 2000000000)
vc3 = VentureCapitalist.new("Dollah Dollah Billz", 18000000000)

fr1 = FundingRound.new(s1, vc3, "Series A", 5000000)
fr2 = FundingRound.new(s2, vc2, "Seed", 2000000)
fr3 = FundingRound.new(s3, vc1, "Angel", 3000000)
fr4 = FundingRound.new(s1, vc1, "Series B", 500000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line